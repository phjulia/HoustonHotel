package com.pjatk.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.pjatk.models.EmailMessage;
import com.pjatk.service.EmailService;

/**
 * @author Yuliia Likhytska
 */

@Controller
public class EmailController {

	@Autowired
	private EmailService emailService;
	
	@GetMapping(value="/email")
	public String showEmail(Model model) {
		model.addAttribute("email", new EmailMessage());
		model.addAttribute("sender",emailService.getSender());
		return "email";
	}
	@GetMapping(value="/email_success")
	public String emailSentForm() {
		return "email_success";
	}
	
	
	@PostMapping(value="/email")
	public String sendEmail(@Valid @ModelAttribute("email") EmailMessage email,
			BindingResult bindingResult, Model model) {
		
		/* * *validation* * */
		if (bindingResult.hasErrors()) {
	        return "email";
	    }
		String content = email.getMessage()+"<br><br> Pozdrawiam,<br><br>"+emailService.getSender();
			emailService.sendEmail(email.getRecepient(),email.getSubject(),content);

		return "redirect:/email_success";

      
	}
}
