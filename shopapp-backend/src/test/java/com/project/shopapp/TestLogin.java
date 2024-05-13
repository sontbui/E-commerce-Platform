package com.project.shopapp;

import org.openqa.selenium.By;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

//@SpringBootTest
public class TestLogin {

	WebDriver driver;

	@BeforeTest
	public void init(){
		WebDriverManager.chromedriver().setup();
		driver = new ChromeDriver();
		driver.get("http://localhost:4200/login");
	}
	//Sign in for admin
    @Test
    public void TestCase1(){

		driver.findElement(By.name("phone")).sendKeys("123456");
		driver.findElement(By.name("password")).sendKeys("123123");
		driver.findElement(new By.ByClassName("login-button")).click();
	}

	//Sign in for user
	@Test
	public void TestCase2()
	{
		driver.findElement(By.name("phone")).sendKeys("123123");
		driver.findElement(By.name("password")).sendKeys("123123");
		driver.findElement(new By.ByClassName("login-button")).click();
	}
	//Null phone and password
	@Test
	public void TestCase3()
	{
		driver.findElement(By.name("phone")).sendKeys("");
		driver.findElement(By.name("password")).sendKeys("");
		driver.findElement(new By.ByClassName("login-button")).click();
	}

	//Null phone, correct password
	@Test
	public void TestCase4()
	{
		driver.findElement(By.name("phone")).sendKeys("");
		driver.findElement(By.name("password")).sendKeys("123123");
		driver.findElement(new By.ByClassName("login-button")).click();
	}

	//correct phone, null password
	@Test
	public void TestCase5()
	{
		driver.findElement(By.name("phone")).sendKeys("123123");
		driver.findElement(By.name("password")).sendKeys("");
		driver.findElement(new By.ByClassName("login-button")).click();
	}

	//correct phone, wrong password
	@Test
	public void TestCase6()
	{
		driver.findElement(By.name("phone")).sendKeys("123123");
		driver.findElement(By.name("password")).sendKeys("hhhhh");
		driver.findElement(new By.ByClassName("login-button")).click();
	}


	//wrong phone, correct password
	@Test
	public void TestCase7()
	{
		driver.findElement(By.name("phone")).sendKeys("111111111111111");
		driver.findElement(By.name("password")).sendKeys("123123");
		driver.findElement(new By.ByClassName("login-button")).click();
	}


	//wrong phone, wrong password
	@Test
	public void TestCase9()
	{
		driver.findElement(By.name("phone")).sendKeys("1111111111");
		driver.findElement(By.name("password")).sendKeys("55555555");
		driver.findElement(new By.ByClassName("login-button")).click();
	}



	@AfterTest
	public void tearDown(){
		driver.quit();
	}



}

