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

//@SpringBootTest
public class TestLogin {

	WebDriver driver;

	@BeforeTest
	public void init(){
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
		driver.findElement(By.name("phone")).sendKeys("0123456789");
		Thread.sleep(500);
		driver.findElement(By.name("password")).sendKeys("123123");
		Thread.sleep(500);
		driver.findElement(new By.ByClassName("login-button")).click();
		Thread.sleep(500);
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
		if (driver != null) {
			driver.quit();
		}
	}

}

