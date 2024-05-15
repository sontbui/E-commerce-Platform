package com.project.shopapp;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;

import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class TestRegister {

    WebDriver driver;

    @BeforeTest
    public void init(){
        WebDriverManager.chromedriver().setup();

        driver = new ChromeDriver();
        driver.get("http://localhost:4200");
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // Implicit wait
        driver.manage().timeouts().pageLoadTimeout(Duration.ofSeconds(30)); // Page load timeout
        driver.manage().timeouts().setScriptTimeout(Duration.ofSeconds(30)); // Script timeout

    }
    //Sign in for admin
    @Test
    public void TestCase1() throws InterruptedException {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
        driver.findElement(By.id("btn-login")).click();
        Thread.sleep(2000);
        driver.findElement(By.id("btn-register")).click();

        driver.findElement(By.name("phone")).sendKeys("0963101750");
        driver.findElement(By.name("password")).sendKeys("123123");
        driver.findElement(By.name("retypePassword")).sendKeys("123123");
        driver.findElement(By.name("fullName")).sendKeys("Luu Bang Thuan");
        driver.findElement(By.name("dateOfBirth")).sendKeys("20012000");
        driver.findElement(By.name("address")).sendKeys("HCM City");
        driver.findElement(new By.ByClassName("register-button")).click();


    }
    @AfterTest
    public void tearDown(){
        if (driver != null)
            driver.quit();
    }


}
