package com.project.shopapp;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class TestRegister {
    WebDriver driver;

    @BeforeTest
    public void init(){
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.get("http://localhost:4200/register");
    }

    @Test
    public void TestCase9(){
        driver.findElement(By.name("phone")).sendKeys("0963101750");
        driver.findElement(By.name("password")).sendKeys("123456");
        driver.findElement(By.name("retypePassword")).sendKeys("123456");
        driver.findElement(By.name("dateOfBirth")).sendKeys("10102000");
        driver.findElement(By.name("address")).sendKeys("HCM");
        driver.findElement(new By.ByClassName("register-button")).click();
    }


    @AfterTest
    public void tearDown(){
        driver.quit();
    }


}
