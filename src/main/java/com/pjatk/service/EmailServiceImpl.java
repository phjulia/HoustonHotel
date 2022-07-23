package com.pjatk.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.pjatk.dao.EmailDAO;
import com.pjatk.dao.EmpDAO;
import com.pjatk.dao.RequestDAO;
import com.pjatk.helpers.Constants;
import com.pjatk.models.Emp;
/**
 * @author Yuliia Likhytska
 */
@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailDAO emailDAO;
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private EmpDAO empDAO;
	
	@Autowired
	private RequestDAO requestDAO;


	@Override
	public void sendEmail(String recepient, String subject, String message) {
		try {
			
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
		String encodingOptions = "text/html; charset=UTF-8";
		
			mimeMessage.setHeader("Content-Type", encodingOptions);

		try {
			
			helper.setFrom(new InternetAddress(Constants.HOTEL_EMAIL_ADDRESS));
			helper.setTo(recepient);
			String mimeSubject = null;
			if(subject == null) {
				mimeSubject="";
			}else {
				mimeSubject=subject;
			}
			helper.setSubject(mimeSubject);
			String content =message;
			helper.setText(content, true);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		mailSender.send(mimeMessage);
		} catch (MessagingException e1) {
			e1.printStackTrace();
		}
		emailDAO.saveEmailToDatabase(recepient,subject,message,requestDAO.getLoggedUserId());
	}
	
	public String getSender() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		try {
		
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    String user = authentication.getName();
		   Emp emp = empDAO.findEmpByEmail(user);
		   return emp.getFirst_name()+" "+emp.getLast_name();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
