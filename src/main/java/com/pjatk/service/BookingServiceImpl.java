package com.pjatk.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.BookingDAO;
import com.pjatk.models.Booking;

import com.pjatk.dao.GuestDAO;
import com.pjatk.models.Guest;

@Service
public class BookingServiceImpl implements BookingService{


	@Autowired
	private BookingDAO bookingDAO;

	@Override
	public List<Booking> getBookings(Date selectedDate) {
		return bookingDAO.getBookings(selectedDate);
		 
	}

	@Override
	public Booking getBooking(int id) {
		return bookingDAO.getBooking(id);
	}

	@Override
	public void updateBooking(Booking booking) {
		bookingDAO.updateBooking(booking);
		
	}
	
	@Override
	public Booking addBooking(Booking booking) {
		return bookingDAO.addBooking(booking);
	}
	
	@Override
	public List<String> getAllRooms() {
		return bookingDAO.getAllRooms();
	}

	  

}
