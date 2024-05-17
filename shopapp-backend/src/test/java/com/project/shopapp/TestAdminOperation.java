package com.project.shopapp;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Alert;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.testng.annotations.*;

//@SpringBootTest
public class TestAdminOperation {

    WebDriver driver;
    private List<WebDriver> drivers = new ArrayList<>();

    @BeforeMethod
    public void init() {
        WebDriverManager.chromedriver().setup();

        driver = new ChromeDriver();
        driver.get("http://localhost:4200");
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // Implicit wait
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30)); // Page load timeout
        driver.manage().timeouts().setScriptTimeout(Duration.ofSeconds(30)); // Script timeout
        drivers.add(driver); // Thêm driver vào danh sách
        Helper.setDriver(driver); // Set driver cho Helper
    }

    // Using order
//    @Test
//    public void TestCase1() throws InterruptedException {
//        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
//        WebDriver driver = drivers.get(drivers.size() - 1); // Lấy driver hiện tại
//
//        driver.findElement(By.id("btn-login")).click();
//
//        //thao tác đăng nhập vào admin
//        Helper.login(driver, "0123456789", "123123");
//        Thread.sleep(1000);
//
//        //tìm kiếm đơn hàng
//        driver.findElement(By.className("form-control")).sendKeys("thung");
//        Thread.sleep(1000);
//        Helper.clickElement(driver, "btn-primary", 0);
//        Thread.sleep(1000);
//        Helper.clickElement(driver, "btn-primary", 1);
//        Thread.sleep(1000);
//
//        //chuyển đổi status đơn hàng
//        JavascriptExecutor js = (JavascriptExecutor) driver;//cuộn trang xuống 500px
//        js.executeScript("window.scrollBy(0, 500)");
//        Helper.selectOptionByIndex(driver, "#statusSelect", 2);
//        Thread.sleep(1000);
//        driver.findElement(By.id("btn-save")).click();
//        Thread.sleep(1000);
//
//        //delete order
//        Helper.clickElement(driver, "btn-danger", 1);
//        Helper.acceptAlert(driver);
//    }


    // Using categories
    @Test
    public void TestCase2() throws InterruptedException {
//        WebDriver driver = drivers.get(drivers.size() - 1); // Lấy driver hiện tại
        driver.findElement(By.id("btn-login")).click();
        Helper.login(driver, "0123456789", "123123");


        //thao tác thêm một category
        driver.findElement(By.id("test_categories")).click();
        Thread.sleep(5000);
        driver.findElement(new By.ByClassName("btn-success")).click();
        driver.findElement(By.id("name")).sendKeys("a");
        Thread.sleep(5000);
        driver.findElement(By.className("btn-primary")).click();
        Thread.sleep(5000);

        //update category
        Helper.clickElement(driver, "btn-primary", 0);
        Thread.sleep(5000);
        WebElement textField = driver.findElement(By.id("name"));
        textField.clear();
        textField.sendKeys("abcxyz");
        Thread.sleep(500);
        driver.findElement(By.className("btn-primary")).click();
        Thread.sleep(500);

        //delete category
        Helper.clickElement(driver,"btn-danger", 1);
        Thread.sleep(500);
        Helper.acceptAlert(driver);
        Thread.sleep(500);
    }




//
//
//        //thao tác tìm sản phẩm trong product
//        driver.findElement(By.id("test_product")).click();
//        driver.findElement(new By.ByClassName("form-control")).sendKeys("Tivi");
//        driver.findElement(By.id("btn-find")).click();
//        Thread.sleep(1000);
//        driver.findElement(new By.ByClassName("btn-primary")).click();
//        Thread.sleep(1000);
//
//        //thao tác thêm sản phẩm trong product
//        driver.findElement(By.id("btn-add")).click();
//        driver.findElement(By.id("name")).sendKeys("test");
//        driver.findElement(By.id("price")).sendKeys("10");
//        driver.findElement(By.id("description")).sendKeys("test description");
//
//        WebElement userDropdown = driver.findElement(By.id("category"));
//        Select dropdown = new Select(userDropdown);
//        dropdown.selectByIndex(0);
//        Thread.sleep(1000);

        //WebElement fileInput = driver.findElement(By.id("images"));
        // chưa accept được path ảnh
        //fileInput.sendKeys("C:\Users\Admin\OneDrive\Hình ảnh\received_5645669542185850.jpg");


        //thao tác quản lý user
//        driver.findElement(By.id("test_user")).click();
//        Thread.sleep(1000);
//        Helper.clickElement(driver, "btn-danger", 2);
//        Helper.acceptAlert(driver);
//        Thread.sleep(1000);


    @AfterMethod
    public void tearDown(){
        Helper.closeAllBrowser();
    }
}
