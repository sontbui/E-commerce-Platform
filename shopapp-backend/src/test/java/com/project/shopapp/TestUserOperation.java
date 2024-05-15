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

        //thao tác đăng nhập vào admin
        driver.findElement(By.name("phone")).sendKeys("0963101750");
        Thread.sleep(500);
        driver.findElement(By.name("password")).sendKeys("123123");
        Thread.sleep(500);
        driver.findElement(new By.ByClassName("login-button")).click();
        Thread.sleep(500);

        driver.findElement(new By.ByClassName("search-input")).sendKeys("15");
        Thread.sleep(1000);
        WebElement userDropdown = driver.findElement(new By.ByClassName("product-category"));
        Select dropdown = new Select(userDropdown);
        dropdown.selectByIndex(3);

        driver.findElement(By.id("btn-search")).click();
        Thread.sleep(2000);

        var products = driver.findElements(By.className("product-item"));

        WebElement secondProduct = products.get(0); // index 0 lay phan tu thu 1
        secondProduct.click();

        Thread.sleep(2000);

    }


    @AfterTest
    public void tearDown(){
        if (driver != null)
            driver.quit();
    }
}