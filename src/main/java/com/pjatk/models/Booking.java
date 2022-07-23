package com.pjatk.models;

import java.io.Serializable;
import java.util.List;

public class Booking implements Serializable{
	private static final long serialVersionUID =1L;
	private int id;

	private String guestimie;
	private String guestnazwisko;
	private String guestpesel;
	private String document_number;
	private String document_type;
	private String room;
	private String start;
	private String end;
	private boolean available;
	
	private List<String> rooms;
	
	private String created_date;
	private String booking_date;
	private int booking_price;
	private Integer roomNum;
	private String guest_name;
	
	public Booking(int id, String created_date, String booking_date, Integer roomNum) {
		super();
		this.id = id;
		this.created_date = created_date;
		this.booking_date = booking_date;
		this.roomNum = roomNum;
	}
	
	public Booking() {
		super();
		
	}

	public Booking(int id, 
//			String guestid,
			String guestimie, String guestnazwisko, String guestpesel, String document_number, String document_type,  String room,  String start,  String end ) 
	{
		super();
		this.id = id;
//		this.guestid = guestid;
		this.guestimie = guestimie;
		this.guestnazwisko = guestnazwisko;
		this.guestpesel = guestpesel;
		this.document_number = document_number;
		this.document_type = document_type;
		this.room = room;
		this.start = start;
		this.end=end;
		
	}
	
	public Booking(int id, 
//			String guestid,
			String guestimie, String guestnazwisko, String guestpesel,  String room, Integer roomNum,  String start,  String end, boolean available) 
	{
		super();
		this.id = id;
//		this.guestid = guestid;
		this.guestimie = guestimie;
		this.guestnazwisko = guestnazwisko;
		this.guestpesel = guestpesel;
		this.room = room;
		this.roomNum = roomNum;
		this.start = start;
		this.end=end;
		this.available = available;
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getGuestimie() {
		return guestimie;
	}
	public void setGuestimie(String guestimie) {
		this.guestimie = guestimie;
	}
	public String getGuestnazwisko() {
		return guestnazwisko;
	}
	public void setGuestnazwisko(String guestnazwisko) {
		this.guestnazwisko = guestnazwisko;
	}
	public String getGuestpesel() {
		return guestpesel;
	}
	public void setGuestpesel(String guestpesel) {
		this.guestpesel = guestpesel;
	}
	public String getDocument_number() {
		return document_number;
	}
	public void setDocument_number(String document_number) {
		this.document_number = document_number;
	}
	public String getDocument_type() {
		return document_type;
	}
	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}
	public Integer getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}
	
	public int getBooking_price() {
		return booking_price;
	}
	public void setBooking_price(int booking_price) {
		this.booking_price = booking_price;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public List<String> getRooms() {
		return rooms;
	}

	public void setRooms(List<String> rooms) {
		this.rooms = rooms;
	}
	
	
	@Override
	public String toString() {
		return "Booking [id=" + id + 
				", Guestimie=" + guestimie + ", Guestnazwisko=" + guestnazwisko + ", Guestpesel=" + guestpesel + ", Document_number=" + document_number + ", Document_type=" + document_type + ", room=" + room + ", start=" + start
				+ ", end=" + end +
				", created_date=" + created_date + ", booking_date=" 
				+ booking_date + ", booking_price=" + booking_price + ", roomNum=" + roomNum + ", available=" + available + ", guest_name=" + guest_name + ", Rooms=" + rooms
				+ "]";
	}
	
	
}
