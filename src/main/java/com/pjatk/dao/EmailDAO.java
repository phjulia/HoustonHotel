package com.pjatk.dao;
/**
 * @author Yuliia Likhytska
 */
public interface EmailDAO {

	public void saveEmailToDatabase(String recepient, String subject, String message, int sender);
}
