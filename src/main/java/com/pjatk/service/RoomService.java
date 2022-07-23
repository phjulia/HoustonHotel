package com.pjatk.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.pjatk.models.Room;
/**
 * @author Yuliia Likhytska
 */
public interface RoomService {
	public Room getRoom(int id);
	public void updateRoom(Room room);
	public Page<Room> findAll(PageRequest pageable);
	public Page<Room> findAll(int minPrice, int maxPrice, PageRequest pageable);

}
