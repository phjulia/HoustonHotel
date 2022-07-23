package com.pjatk.service;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.pjatk.helpers.EmpNotFoundException;
import com.pjatk.helpers.TokenNotFoundException;
import com.pjatk.models.Emp;
import com.pjatk.models.Login;
/**
 * @author Yuliia Likhytska
 */
public interface EmpService {
	
	public Emp validateEmp(Login login);
	public Integer findByEmail(String email);
	public Emp findEmpByEmail(String email);
	public Integer findByResetPasswordToken(String token);
	public String setResetPasswordToken(String email) throws EmpNotFoundException;
	public void sendEmail(String recipientEmail, String link) throws MessagingException, UnsupportedEncodingException;
	public String updatePass(int emp_id, String newPassword);
	public void sendConfirmation(String recipientEmail) throws MessagingException, UnsupportedEncodingException ;
	public Emp getEmp(int id);
	public void updateEmp(Emp emp);
	public void addEmp(Emp emp);
	public Boolean validatePasswordResetToken(String token) throws TokenNotFoundException;
	public void sendAccountCreatedEmail(String string, String string2) throws MessagingException, UnsupportedEncodingException;
	public int findByPesel(String pesel);
	public List<String> getAllJobs();
	public Page<Emp> findAll(PageRequest pageable);
	public Page<Emp> findAll(String parameter, PageRequest pageable);
}
