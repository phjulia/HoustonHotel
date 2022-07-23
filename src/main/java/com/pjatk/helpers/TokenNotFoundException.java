package com.pjatk.helpers;
/**
 * @author Yuliia Likhytska
 */
public class TokenNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

	public TokenNotFoundException(String error){
		super(error);
	}
}
