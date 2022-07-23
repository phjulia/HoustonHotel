package com.pjatk.models;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
/**
 * @author Yuliia Likhytska
 */
public class Room implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer roomId;
	private Integer roomNumber;
	private String pictureLocation;
	private String roomClass;
	private String category;
	@NotNull(message="Pole nie może być puste")
	@Min(value=1,message="Cena nie może być ujemna lub równa 0")
	private int pricePerNight;
	private List<String> categories;
	private boolean active;

	public Room() {
	}

	public Room(Integer roomId, Integer roomNumber, String pictureLocation, String category, String roomClass,
			int pricePerNight) {
		super();
		this.roomId = roomId;
		this.roomNumber = roomNumber;
		this.pictureLocation = pictureLocation;
		this.category = category;
		this.roomClass = roomClass;
		this.pricePerNight = pricePerNight;
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Integer getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(Integer roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getPictureLocation() {
		return pictureLocation;
	}

	public void setPictureLocation(String pictureLocation) {
		this.pictureLocation = pictureLocation;
	}

	public String getClassName() {
		return roomClass;
	}

	public void setClassName(String roomClass) {
		this.roomClass = roomClass;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPricePerNight() {
		return pricePerNight;
	}

	public void setPricePerNight(int pricePerNight) {
		this.pricePerNight = pricePerNight;
	}

	

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomNumber=" + roomNumber + ", pictureLocation=" + pictureLocation
				+ ", roomClass=" + roomClass + ", category=" + category + ", pricePerNight=" + pricePerNight
				+ ", active=" + active + ", categories=" + categories;
	}
}
