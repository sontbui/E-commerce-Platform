package com.project.shopapp;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import java.util.List;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

//@SpringBootTest
public class TestUserOperation {

    WebDriver driver;

    @BeforeTest
    public void init() {
        WebDriverManager.chromedriver().setup();

        driver = new ChromeDriver();
        driver.get("http://localhost:4200");
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // Implicit wait
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30)); // Page load timeout
        driver.manage().timeouts().setScriptTimeout(Duration.ofSeconds(3000)); // Script timeout

    }

    //Sign in for admin
    @Test
    public void TestCase1() throws InterruptedException {

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));

        driver.findElement(By.id("btn-login")).click();

        //thao tác đăng nhập vào user
        driver.findElement(By.name("phone")).sendKeys("0963101750");
        Thread.sleep(500);
        driver.findElement(By.name("password")).sendKeys("123123");
        Thread.sleep(500);
        driver.findElement(new By.ByClassName("login-button")).click();
        Thread.sleep(500);


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



    @AfterTest
    public void tearDown(){
        if (driver != null)
            driver.quit();
    }
}