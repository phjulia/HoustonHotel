package com.pjatk.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.pjatk.models.Room;
/**
 * @author Yuliia Likhytska
 */
public interface RoomDAO {
	public void updateRoom(Room room);
	public Room getRoom(int id);
	public Page<Room> findAll(PageRequest pageable);
	public Page<Room> findAll(int minPrice, int maxPrice, PageRequest pageable);
}
