package com.pjatk.models;

import java.io.Serializable;
/**
 * @author Yuliia Likhytska
 */
public class Vacation implements Serializable{
	private static final long serialVersionUID = 1L;
	private int emp_id; 
    private String date_from;
    private String date_to;
    private boolean is_approved;
    private String emp;
    private int id;
    private String emp_email;
    private String reviewed_by;
    
    
	public String getDate_from() {
		return date_from;
	}
	public String getReviewed_by() {
		return reviewed_by;
	}
	public void setReviewed_by(String reviewed_by) {
		this.reviewed_by = reviewed_by;
	}
	public Vacation(String date_from, String date_to, int  emp_id) {
		this.date_from = date_from;
		this.date_to = date_to;
		this.emp_id= emp_id;
	}
	/* * * *This constructor is needed for ajax calls * * */
	public Vacation(String date_from, String date_to, String  emp_email) {

		this.date_from = date_from;
		this.date_to = date_to;
		this.emp_email= emp_email;
	}
	public Vacation(int id, String date_from, String date_to, String  emp_email) {
		this.id = id;
		this.date_from = date_from;
		this.date_to = date_to;
		this.emp_email= emp_email;
	}
	public Vacation(String date_from, String date_to, int  emp_id,boolean is_approved) {
		this.date_from = date_from;
		this.date_to = date_to;
		this.emp_id= emp_id;
		this.is_approved=is_approved;
	}

	public Vacation() {
	}
	public void setDate_from(String date_from) {
		this.date_from = date_from;
	}
	public String getDate_to() {
		return date_to;
	}
	public void setDate_to(String date_to) {
		this.date_to = date_to;
	}
	
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	
	public boolean isIs_approved() {
		return is_approved;
	}
	public void setIs_approved(boolean is_approved) {
		this.is_approved = is_approved;
	}
	
	public String getEmp() {
		return emp;
	}
	public void setEmp(String emp) {
		this.emp = emp;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	@Override
	public String toString() {
		return "{date_from:" + date_from + ", date_to=" + date_to+", " + emp_id+"]";
	}
    

}
