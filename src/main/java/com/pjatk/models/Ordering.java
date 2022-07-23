package com.pjatk.models;

import java.io.Serializable;
import java.util.List;

import com.pjatk.service.OrderingService;

public class Ordering implements Serializable{
	private static final long serialVersionUID =1L;
	private Integer orderingId;
	private int bookingId;
	private int orderItemId;
	private int itemId;
	private String name;
	private int reservationId;
	private String item;
	private String firstName;
	private String lastName;
	private int roomNum;
	

	
	private List<String> names;
	
	public Ordering() {
		super();
	}

	public Ordering(Integer orderingId, String firstName, String lastName, int roomNum, int reservationId, int orderItemId, int itemId, String name) 
	{
		super();
		this.orderingId = orderingId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.roomNum = roomNum;
		this.reservationId = reservationId;
		this.orderItemId = orderItemId;
	}
	public Ordering(Integer orderingId, int bookingId,  int orderItemId, String name ) 
	{
		super();
		this.orderingId = orderingId;
		this.bookingId = bookingId;
		this.orderItemId = orderItemId;
		this.name = name;
		
	}
	public Integer getOrderingId() {
		return orderingId;
	}
	public void setOrderingId(int orderingId) {
		this.orderingId = orderingId;
	}
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public List<String> getNames() {
		return names;
	}

	public void setNames(List<String> names) {
		this.names = names;
	}
	
	@Override
	public String toString() {
		return "Ordering [OrderingId=" + orderingId + ", OrderItemId=" + orderItemId + ", ReservationId=" + reservationId + ", Item=" + item + ", FirstName=" + firstName + ", LastName=" + lastName + ", RoomNum=" + roomNum + ", Names=" + names + ", BookingId=" + bookingId + ", Name=" + name + ", ItemId=" + itemId +  "]";
	}

	

}
