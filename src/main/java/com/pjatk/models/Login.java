package com.pjatk.models;
/**
 * @author Yuliia Likhytska
 */
public class Login {
	private String email;
	private String password;
	
	
	@Override
	public String toString() {
		return "Login [email=" + email + ", password=" + password + "]";
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	


}
