package com.pjatk.models;

import java.io.Serializable;
import java.util.List;

import com.pjatk.service.ItemService;

public class Item implements Serializable{
	private static final long serialVersionUID =1L;
	private Integer itemId;
	private String name;
	private double price;
	private String category;
	private String brand;
	


	private List<String> categories;
	private List<String> brands;

	
	public Item() {
		super();
	}

	public Item(Integer itemId, String name,  double price,  String category,  String brand) 
	{
		super();
		this.itemId = itemId;
		this.name = name;
		this.price = price;
		this.category = category;
		this.brand=brand;
		
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}

	public List<String> getBrands() {
		return brands;
	}

	public void setBrands(List<String> brands) {
		this.brands = brands;
	}
	
	@Override
	public String toString() {
		return "Item [ItemId=" + itemId + ", Name=" + name + ", Price=" + price + ", Category=" + category
				+ ", Brand=" + brand + ", categories=" + categories + ", brands=" + brands + "]";
	}

	

}
