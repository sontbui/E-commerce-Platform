package com.project.shopapp;

import com.project.shopapp.utils.WebUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import static org.junit.Assert.*;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

//@SpringBootTest

class ShopappApplicationTests {
	@Test
	public void testGetCurrentRequest() {
		// Tạo một mock HttpServletRequest
		MockHttpServletRequest mockRequest = new MockHttpServletRequest();

		// Thiết lập mockRequest vào RequestContextHolder
		ServletRequestAttributes attributes = mock(ServletRequestAttributes.class);
		when(attributes.getRequest()).thenReturn(mockRequest);
		RequestContextHolder.setRequestAttributes(attributes);

		// Gọi phương thức getCurrentRequest()
		HttpServletRequest actualRequest = WebUtils.getCurrentRequest();

		// Kiểm tra xem kết quả có đúng là mockRequest không
		Assert.assertEquals(mockRequest, actualRequest);
	}
	@Test
	public void testAddition() {

		int result = 3 + 4;
		assertEquals(7, result); // Kiểm tra kết quả của phép cộng
	}

}
