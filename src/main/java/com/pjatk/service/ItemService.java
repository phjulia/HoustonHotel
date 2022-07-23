package com.pjatk.service;

import java.util.List;



import com.pjatk.models.Item;


public interface ItemService {
	
	public List<Item> getItems();
	public Item getItem(int id);
	public void addItem(Item item);
}
