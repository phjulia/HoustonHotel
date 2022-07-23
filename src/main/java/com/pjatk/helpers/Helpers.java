package com.pjatk.helpers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
/**
 * @author Yuliia Likhytska
 */
public class Helpers {

	public static LocalDate getLocalDate(String date, DateTimeFormatter formatter) {
		  return LocalDate.parse(date, formatter);
	}
}
