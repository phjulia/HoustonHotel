package com.pjatk.service;

import java.util.List;

import com.pjatk.models.Booking;
/**
 * @author Yuliia Likhytska
 */
public interface HomeService {

	public int getBookingsCountThisMonth();

	public int getBookingsCountLastMonth();

	public List<Booking> getLatestBookings();
	
	public int getOccupiedRooms();
	public int getAvailableRooms();
	public int getInactiveRooms();

	public int getAllBookingsCount();

}
