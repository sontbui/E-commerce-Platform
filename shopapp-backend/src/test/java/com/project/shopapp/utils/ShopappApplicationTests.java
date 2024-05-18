package com.project.shopapp.utils;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

class ShopappApplicationTests {

	WebDriver driver;

	@BeforeTest
	public void init(){
		WebDriverManager.chromedriver().setup();
		driver = new ChromeDriver();
		driver.get("http://localhost:4200/");
	}

	@Test
	public void test1(){
		driver.findElement(By.className("nav-link")).click();
	}


	@AfterTest
	public void tearDown(){
		driver.quit();
	}







}