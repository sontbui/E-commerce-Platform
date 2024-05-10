package com.project.shopapp.utils;


import jakarta.servlet.http.HttpServletRequest;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
//@SpringBootTest
public class WebUtilsTest {

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
        assertEquals(mockRequest, actualRequest);
    }

}
