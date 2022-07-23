package com.pjatk.dao;

import java.util.List;

import com.pjatk.models.Booking;
/**
 * @author Yuliia Likhytska
 */
public interface HomeDAO {
	public int getBookingsCountThisMonth();
	public int getBookingsCountLastMonth();
	public List<Booking> getLatestBookings();
	public int getOccupiedRooms();
	public int getAvailableRooms();
	public int getInactiveRooms();
	public int getAllBookingsCount();
}
