package com.pjatk.helpers;

import org.springframework.security.core.AuthenticationException;
/**
 * @author Yuliia Likhytska
 */
public class Unauthorized extends AuthenticationException{

	private static final long serialVersionUID = 1L;

	public Unauthorized(String msg) {
		super(msg);
	}

}
