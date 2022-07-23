package com.pjatk.models;

public class Request {
	private int id;
	private Vacation vacation;
	private Emp requestor;
	private String request_status;
	private String commentary;
	private int requestor_vacation_days;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Vacation getVacation() {
		return vacation;
	}
	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}
	
	public Emp getRequestor() {
		return requestor;
	}
	public void setRequestor(Emp requestor) {
		this.requestor = requestor;
	}
	public String getRequest_status() {
		return request_status;
	}
	public void setRequest_status(String request_status) {
		this.request_status = request_status;
	}
	public String getCommentary() {
		return commentary;
	}
	public void setCommentary(String commentary) {
		this.commentary = commentary;
	}
	public int getRequestor_vacation_days() {
		return requestor_vacation_days;
	}
	public void setRequestor_vacation_days(int requestor_vacation_days) {
		this.requestor_vacation_days = requestor_vacation_days;
	}

     public Request(int id, String request_status, String commentary) {
    	 this.id = id;
 		this.request_status = request_status;
 		this.commentary = commentary;
	}
	public Request() {
		
	}
	@Override
	public String toString() {
		return "Request [id=" + id + ", vacation=" + vacation + ", requestor=" + requestor + ", request_status="
				+ request_status + ", commentary=" + commentary + "]";
	}

	
}
