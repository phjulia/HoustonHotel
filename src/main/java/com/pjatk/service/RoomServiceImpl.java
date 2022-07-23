package com.pjatk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.pjatk.dao.RoomDAO;
import com.pjatk.models.Room;
/**
 * @author Yuliia Likhytska
 */
@Service
public class RoomServiceImpl implements RoomService{


	@Autowired
	private RoomDAO roomDAO;

	@Override
	public Room getRoom(int id) {
		return roomDAO.getRoom(id);
	}

	@Override
	public void updateRoom(Room room) {
		roomDAO.updateRoom(room);
		
	}

	@Override
	public Page<Room> findAll(PageRequest pageable) {
		return roomDAO.findAll(pageable);
	}

	@Override
	public Page<Room> findAll(int minPrice, int maxPrice, PageRequest pageable) {
		return roomDAO.findAll(minPrice,maxPrice,pageable);
	}
	  

}
