package com.project.shopapp;

import org.openqa.selenium.WebDriver;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

public class TestRegister {
    private List<WebDriver> drivers = new ArrayList<>();

    @BeforeMethod
    public void init(){
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        driver.get("http://localhost:4200/register");
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10)); // Implicit wait
        drivers.add(driver); // Thêm driver vào danh sách
        Helper.setDriver(driver); // Set driver cho Helper
    }

    @Test
    public void TestCase1() throws InterruptedException {
        WebDriver driver = drivers.get(drivers.size() - 1); // Lấy driver hiện tại
        Helper.register(driver, "0345872900", "123123", "123123", "Luu Bang Thuan", "20012000", "HCM City");
        Helper.acceptAlert(driver);
    }

    @Test
    public void TestCase2() throws InterruptedException {
        WebDriver driver = drivers.get(drivers.size() - 1); // Lấy driver hiện tại
        Helper.register(driver, "0345872900", "123123", "123123", "Bui Thanh Son", "11112001", "HCMs");
        Helper.acceptAlert(driver);
    }

    @AfterMethod
    public void tearDown(){
        Helper.closeAllBrowser();
    }
}
