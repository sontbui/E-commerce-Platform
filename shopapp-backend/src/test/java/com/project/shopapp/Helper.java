package com.project.shopapp;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

public class Helper {

    private static String identifyLocatorType(String locator) {
        if (locator.startsWith(".")) {
            return "className";
        } else if (locator.startsWith("#")) {
            return "id";
        } else {
            return "unknown";
        }
    }
    public static void selectOptionByIndex(WebDriver driver, String locator, int index) {
        WebElement dropdownElement = findElementByLocator(driver, locator);

        if (dropdownElement != null) {
            Select dropdown = new Select(dropdownElement);
            dropdown.selectByIndex(index);
        } else {
            System.out.println("No element found with locator: " + locator);
        }
    }

    private static WebElement findElementByLocator(WebDriver driver, String locator) {
        String locatorType = identifyLocatorType(locator);

        if (locatorType.equals("className")) {
            return driver.findElement(By.className(locator.substring(1)));
        } else if (locatorType.equals("id")) {
            return driver.findElement(By.id(locator.substring(1)));
        } else {
            System.out.println("Invalid locator type provided: " + locator);
            return null;
        }
    }

    public static void clickElement(WebDriver driver, String locator, int index) {
        var elements = driver.findElements(By.className(locator));
        WebElement product = elements.get(index);
        product.click();
    }
}
