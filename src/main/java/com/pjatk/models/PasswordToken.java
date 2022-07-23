package com.pjatk.models;

import java.time.LocalDateTime;
/**
 * @author Yuliia Likhytska
 */
public class PasswordToken {
	private String reset_password_token;
	private String email;
	private LocalDateTime expiryDate;
	public String getReset_password_token() {
		return reset_password_token;
	}
	public void setReset_password_token(String reset_password_token) {
		this.reset_password_token = reset_password_token;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDateTime getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(LocalDateTime expiryDate) {
		this.expiryDate = expiryDate;
	}
	public PasswordToken(String reset_password_token, String email, LocalDateTime expiryDate) {
		this.reset_password_token = reset_password_token;
		this.email = email;
		this.expiryDate = expiryDate;
	}
	public PasswordToken() {

	}

}
