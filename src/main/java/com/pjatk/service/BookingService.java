package com.pjatk.service;

import java.util.Date;
import java.util.List;



import com.pjatk.models.Booking;
import com.pjatk.models.Guest;


public interface BookingService {

	public List<Booking> getBookings(Date selectedDate);
	public Booking getBooking(int id);
	public void updateBooking(Booking booking);
	public Booking addBooking(Booking booking);
	public List<String> getAllRooms();
}
