package com.pjatk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.GuestDAO;
import com.pjatk.models.Guest;

@Service
public class GuestServiceImpl implements GuestService{


	@Autowired
	private GuestDAO guestDAO;

	@Override
	public List<Guest> getGuests() {
		return guestDAO.getGuests();
		 
	}

	@Override
	public Guest getGuest(int id) {
		return guestDAO.getGuest(id);
	}

	@Override
	public void updateGuest(Guest guest) {
		guestDAO.updateGuest(guest);
		
	}
	
	@Override
	public void addGuest(Guest guest) {
		guestDAO.addGuest(guest);
	}

	  

}