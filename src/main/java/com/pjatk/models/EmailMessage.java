package com.pjatk.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
/**
 * @author Yuliia Likhytska
 */
public class EmailMessage {
	@NotBlank(message = "Pole odbiorca nie może być puste")
	@Email(message="Pole email jest niepoprawne")
	private String recepient;
	@Size(min = 0, max = 30,message="Pole powinno zawierać do 30 znaków")
	private String subject;
	@NotBlank(message = "Pole nie może być puste")
	@Size(min = 2, max = 1000,message="Pole powinno zawierać od 2 do 1000 znaków")
	private String message;
	
	public String getRecepient() {
		return recepient;
	}
	public void setRecepient(String recepient) {
		this.recepient = recepient;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
