package com.pjatk.helpers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
/**
 * @author Yuliia Likhytska
 */
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException ex) throws IOException, ServletException {
		 if (ex.getMessage() != null && ex.getMessage().equals("User is disabled")) {
			redirectStrategy.sendRedirect(request, response, "/forgot_password");
		} else {
			redirectStrategy.sendRedirect(request, response, "/userNotFound");
		}
	}
}
