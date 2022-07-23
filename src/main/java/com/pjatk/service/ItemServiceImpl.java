package com.pjatk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.ItemDAO;
import com.pjatk.models.Item;

@Service
public class ItemServiceImpl implements ItemService{


	@Autowired
	private ItemDAO itemDAO;

	@Override
	public List<Item> getItems() {
		return itemDAO.getItems();
		 
	}
	
	
	@Override
	public Item getItem(int id) {
		return itemDAO.getItem(id);
	}

	
	@Override
	public void addItem(Item item) {
		itemDAO.addItem(item);
	}


}
