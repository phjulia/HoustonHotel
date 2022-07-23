package com.pjatk.models;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
/**
 * @author Yuliia Likhytska
 */
public class Emp {
	private int empId;
	@NotBlank(message = "Pole imie nie może być puste")
	@Size(min = 2, max = 60,message="Długość pola powinna być od 2 do 60 znaków")
	private String first_name;
	@NotEmpty(message = "Pole nazwisko nie może być puste")
	@Size(min = 2, max = 60,message="Długość pola powinna być od 2 do 60 znaków")
	private String last_name;
	@NotEmpty(message = "Pole pesel nie może być puste")
	@Size(min = 11, max = 11,message="Pole powinno zawierać 11 znaków")
	private String pesel;
	private String address;
	@NotEmpty(message = "Pole nie może być puste")
	private String hire_date;
	@NotEmpty(message = "Pole nie może być puste")
	private String birth_date;
	@NotEmpty(message = "Pole email nie może być puste")
	private String email;
	private String password;
	private String token;
	private String role;
	private String job;
	private int job_id;
	private String resetPasswordToken;
	private boolean isEnabled;
	private int vacation_days;
	
	/* * * * * * in the database only address field is recorded(concatenation of inputCity and inputAddress ..)* * * * * * * */
	@NotEmpty(message = "Pole miasto nie może być puste")
	private String inputCity;
	@NotEmpty(message = "Pole adres nie może być puste")
	private String inputAddress;
	@NotEmpty(message = "Pole kod pocztowy nie może być puste")
	private String inputZip;
	

	
	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public int getVacation_days() {
		return vacation_days;
	}

	public void setVacation_days(int vacation_days) {
		this.vacation_days = vacation_days;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	public Emp() {
		super();
	}

	public Emp(int empId, String first_name, String last_name, String pesel, String address, String hire_date,
			String birth_date, String email, String password, String role) {
		super();
		this.empId = empId;
		this.first_name = first_name;
		this.last_name = last_name;
		this.pesel = pesel;
		this.address = address;
		this.hire_date = hire_date;
		this.birth_date = birth_date;
		this.email = email;
		this.password = password;
		this.role = role;
		//this.job = job;
	}

	public Emp(int empId, String first_name, String last_name, String pesel, String address, String hire_date,
			String birth_date, String email, String password, String token, String role) {
		super();
		this.empId = empId;
		this.first_name = first_name;
		this.last_name = last_name;
		this.pesel = pesel;
		this.address = address;
		this.hire_date = hire_date;
		this.birth_date = birth_date;
		this.email = email;
		this.password = password;
		this.token = token;
		this.role = role;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
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

	public String getPesel() {
		return pesel;
	}

	public void setPesel(String pesel) {
		this.pesel = pesel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHire_date() {
		return hire_date;
	}

	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}

	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", first_name=" + first_name + ", last_name=" + last_name + ", pesel=" + pesel
				+ "getVacation_days " + vacation_days;
	}

	public String getInputCity() {
		return inputCity;
	}

	public void setInputCity(String inputCity) {
		this.inputCity = inputCity;
	}

	public String getInputAddress() {
		return inputAddress;
	}

	public void setInputAddress(String inputAddress) {
		this.inputAddress = inputAddress;
	}

	public String getInputZip() {
		return inputZip;
	}

	public void setInputZip(String inputZip) {
		this.inputZip = inputZip;
	}

}
