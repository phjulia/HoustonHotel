package com.pjatk.models;

import java.io.Serializable;

import com.pjatk.service.GuestService;

public class Guest implements Serializable{
	private static final long serialVersionUID =1L;
	private Integer guestId;
	private String first_name;
	private String last_name;
	private String document_number;
	private String document_type;
	private String pesel;

	
//	public Guest() {
//		super();
//	}

	public Guest(Integer guestId, String first_name,  String last_name,  String document_number,  String document_type, String pesel) 
	{
		super();
		this.guestId = guestId;
		this.first_name = first_name;
		this.last_name = last_name;
		this.document_number = document_number;
		this.document_type=document_type;
		this.pesel=pesel;
		
	}
	public Integer getGuestId() {
		return guestId;
	}
	public void setGuestId(Integer guestId) {
		this.guestId = guestId;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
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
	public String getPesel() {
		return pesel;
	}
	public void setPesel(String pesel) {
		this.pesel = pesel;
	}
	
	
//	@Override
//	public String toString() {
//		return "Guest [GuestId=" + guestId + ", First_name=" + first_name + ", Last_name=" + last_name + ", Document_number=" + document_number
//				+ ", Document_type=" + document_type + ", Pesel=" + pesel + "]";
//	}
//
//	

}
