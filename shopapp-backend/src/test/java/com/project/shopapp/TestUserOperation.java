package com.project.shopapp;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.testng.annotations.*;

//@SpringBootTest
public class TestUserOperation {

    WebDriver driver;
    private List<WebDriver> drivers = new ArrayList<>();


    @BeforeMethod
    public void init() {
        WebDriverManager.chromedriver().setup();

        driver = new ChromeDriver();
        driver.get("http://localhost:4200");
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // Implicit wait
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30)); // Page load timeout
        driver.manage().timeouts().setScriptTimeout(Duration.ofSeconds(3000)); // Script timeout
        drivers.add(driver); // Thêm driver vào danh sách
        Helper.setDriver(driver); // Set driver cho Helper
    }

    @Test
    public void TestCase1(){
        WebDriver driver = drivers.get(drivers.size() - 1); // Lấy driver hiện tại
        driver.findElement(By.id("btn-login")).click();

        //thao tác đăng nhập vào user
        Helper.login(driver,"00123456789","123123");
        Helper.clickElement(driver, "product-item", 3);
        driver.findElement(By.className("btn-success")).click();

        // điền thông tin
        driver.findElement(By.id("cart")).click();
        driver.findElement(By.id("fullname")).sendKeys("Bui Thanh Son");
        driver.findElement(By.id("email")).sendKeys("son@gmail.com");
        driver.findElement(By.id("phone")).sendKeys("00123456789");
        driver.findElement(By.id("address")).sendKeys("HCM city");
        Helper.selectOptionByIndex(driver, "#shippingMethod",0);
        Helper.selectOptionByIndex(driver, "#paymentMethod",1);
        driver.findElement(By.className("btn-light")).click();
    }



    //Operation full for user
    @Test
    public void TestCase2() throws InterruptedException {

        driver.findElement(By.id("btn-login")).click();

        //thao tác đăng nhập vào user
        Helper.login(driver,"0345872900","123123");


        //tìm kiếm sản phẩm hiện có
        driver.findElement(new By.ByClassName("search-input")).sendKeys("15");
        Thread.sleep(500);
        Helper.selectOptionByIndex(driver, ".product-category", 3);
        driver.findElement(By.id("btn-search")).click();
        Thread.sleep(500);

        //chọn sản phẩm đầu tiên sau khi tìm kiếm
        Helper.clickElement(driver, "product-item", 0);
        Thread.sleep(2000);

        //thêm số lượng sản phẩm
        driver.findElement(By.id("increaseIndex")).click();
        driver.findElement(By.className("btn-primary")).click();

        //quay lại trang và tiếp tục mua sắm
        driver.navigate().back();

        //tìm kiếm sản phẩm thứ 2
        driver.findElement(By.className("form-control")).sendKeys("air");
        Thread.sleep(2000);
        Helper.selectOptionByIndex(driver, ".product-category", 1);
        driver.findElement(By.id("btn-search")).click();
        Thread.sleep(2000);
        Helper.clickElement(driver, "product-item", 3);
        Thread.sleep(2000);
        driver.findElement(By.className("btn-primary")).click();
        Thread.sleep(2000);
        driver.findElement(By.id("cart")).click();
        Thread.sleep(2000);

        //điền thông tin để thanh toán 2 sản phẩm đã lựa chọn
        driver.findElement(By.id("cart")).click();
        driver.findElement(By.id("fullname")).sendKeys("Luu Bang Thuan");
        driver.findElement(By.id("email")).sendKeys("thuan@gmail.com");
        driver.findElement(By.id("phone")).sendKeys("0963101750");
        driver.findElement(By.id("address")).sendKeys("HCM city");
        Helper.selectOptionByIndex(driver, "#shippingMethod",0);
        Helper.selectOptionByIndex(driver, "#paymentMethod",1);
        driver.findElement(By.className("btn-light")).click();

    }



    @AfterMethod
    public void tearDown(){
        Helper.closeAllBrowser();
    }
}