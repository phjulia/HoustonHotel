package com.pjatk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.HomeDAO;
import com.pjatk.models.Booking;
/**
 * @author Yuliia Likhytska
 */
@Service
public class HomeServiceImpl implements HomeService{
	@Autowired
	private HomeDAO homeDAO;
	
	@Override
	public int getBookingsCountThisMonth() {
		return homeDAO.getBookingsCountThisMonth();
	}
	@Override
	public int getBookingsCountLastMonth() {
		return homeDAO.getBookingsCountLastMonth();
	}
	@Override
	public List<Booking> getLatestBookings() {
		return homeDAO.getLatestBookings();
	}
	@Override
	public int getOccupiedRooms() {
		return homeDAO.getOccupiedRooms();
	}
	@Override
	public int getAvailableRooms() {
		return homeDAO.getAvailableRooms();
	}
	@Override
	public int getInactiveRooms() {
		return homeDAO.getInactiveRooms();
	}
	@Override
	public int getAllBookingsCount() {
		return homeDAO.getAllBookingsCount();
	}
}
