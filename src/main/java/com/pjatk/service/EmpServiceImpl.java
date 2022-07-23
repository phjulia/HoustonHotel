package com.pjatk.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.pjatk.dao.EmpDAO;
import com.pjatk.helpers.Constants;
import com.pjatk.helpers.EmpNotFoundException;
import com.pjatk.helpers.TokenNotFoundException;
import com.pjatk.models.Emp;
import com.pjatk.models.Login;
/**
 * @author Yuliia Likhytska
 */
@Service
public class EmpServiceImpl implements EmpService{
	
	@Autowired
	private EmpDAO empDAO;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public Emp validateEmp(Login login) {
		 return empDAO.validateEmp(login);
	}

	@Override
	public Integer findByEmail(String email) {
		return empDAO.findByEmail(email);
	}

	@Override
	public Integer findByResetPasswordToken(String token) {
		return empDAO.findByResetPasswordToken(token);
	}
	@Override
	public Boolean validatePasswordResetToken(String token) throws TokenNotFoundException {
		Boolean isExpired=empDAO.isTokenExpired(token);
		if(empDAO.isTokenExpired(token)==null) {
			throw new TokenNotFoundException("Nie ma takiego tokenu");
		}else if(isExpired) {
			return false;
		};
	return true;
	        
	}


	public void sendEmail(String recipientEmail, String link)
	        throws MessagingException, UnsupportedEncodingException {
	    MimeMessage message = mailSender.createMimeMessage();    
	    MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
	    helper.setFrom(new InternetAddress(Constants.HOTEL_EMAIL_ADDRESS));
	    helper.setTo(recipientEmail);
	     
	    String subject = "Resetowanie hasła";
	     
	    String content = "<p><b>Resetowanie hasła do konta HousonHotel</b></p>"
	            + "<p>Poprosiłeś o zresetowanie hasła</p>"
	            + "<p>Aby potwierdzić zresetowanie hasła, proszę użyć następującego linku:</p>"
	            + "<p><u><a href=\"" + link + "\">Zmień hasło</a></u></p>"
	            + "<br>"
	            + "<p>Prosimy zignorować tego maila jeśli nie prosiłeś o zmianę hasła</p>"
	            + "<p><b>Houson Hotel<b></p>";
	     
	    helper.setSubject(subject);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}
	public void sendAccountCreatedEmail(String recipientEmail, String link)
	        throws MessagingException, UnsupportedEncodingException {
	    MimeMessage message = mailSender.createMimeMessage();    
	    MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
	    helper.setFrom(new InternetAddress(Constants.HOTEL_EMAIL_ADDRESS));
	    helper.setTo(recipientEmail);
	     
	    String subject = "Konto na stronie HoustonHotel zostało utworzone";
	     
	    String content = "<p><b>Utworzyliśmy konto dla danego adresu mailowego </b></p>"
	            + "<p>Aby zresetować hasło kliknij w link niżej</p>"
	            + "<p><u><a href=\"" + link + "\">Zmień hasło</a></u></p>"
	            + "<br>"
	            + "<p>Jeśli nie chcesz ustawiać teraz hasła, będziesz mógł to zrobić w dowolnym momencie klikająć \"Przypomnij hasło\" na stronie internetowej.</p>"
	            + "<p><b>Houson Hotel<b></p>";
	     
	    helper.setSubject(subject);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}
	public void sendConfirmation(String recipientEmail)
	        throws MessagingException, UnsupportedEncodingException {
	    MimeMessage message = mailSender.createMimeMessage();    
	    MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
	    helper.setFrom(new InternetAddress(Constants.HOTEL_EMAIL_ADDRESS));
	    helper.setTo(recipientEmail);
	     
	    String subject = "Twoje hasło zostało zmienione";
	     
	    String content = "<p>Cześć, </p>"
	            + "<p>Twoję hasło zostało zmienione</p>"
	            + "<p><b>Houson Hotel<b></p>";
	     
	    helper.setSubject(subject);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}

	@Override
	public String setResetPasswordToken(String email) throws EmpNotFoundException {
		return empDAO.setResetPasswordToken(email);
	}
	     
	    public int getByResetPasswordToken(String token) {
	        return empDAO.findByResetPasswordToken(token);
	    }

		@Override
		public String updatePass(int emp_id, String newPassword) {
	    	return empDAO.updatePass(emp_id,newPassword);
		}

		@Override
		public Emp getEmp(int id) {
			return empDAO.getEmp(id);
		}

		@Override
		public void updateEmp(Emp emp) {
		  empDAO.updateEmp(emp);
		}

		@Override
		public void addEmp(Emp emp) {
			empDAO.addEmp(emp);
		}

		@Override
		public Emp findEmpByEmail(String email) {
			return empDAO.findEmpByEmail(email);
		}

		@Override
		public int findByPesel(String pesel) {
			return empDAO.findByPesel(pesel);
		}

		@Override
		public List<String> getAllJobs() {
			return empDAO.getAllJobs();
		}

		@Override
		public Page<Emp> findAll(PageRequest pageable) {
			return empDAO.findAll(pageable);
		}

		@Override
		public Page<Emp> findAll(String parameter, PageRequest pageable) {
			return empDAO.findAll(parameter,pageable);
		}

}
