package com.pjatk.service;

import java.util.List;



import com.pjatk.models.Guest;


public interface GuestService {

	public List<Guest> getGuests();
	public Guest getGuest(int id);
	public void updateGuest(Guest guest);
	public void addGuest(Guest guest);
}
