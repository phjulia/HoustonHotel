package com.pjatk.service;
/**
 * @author Yuliia Likhytska
 */
public interface EmailService {
	public void sendEmail(String recepient,String subject, String message);
	public String getSender();

}
