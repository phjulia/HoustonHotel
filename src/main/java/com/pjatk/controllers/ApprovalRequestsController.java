package com.pjatk.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pjatk.helpers.Constants;
import com.pjatk.models.Request;
import com.pjatk.models.Vacation;
import com.pjatk.service.EmailService;
import com.pjatk.service.RequestService;

/**
 * @author Yuliia Likhytska
 *
 */

@Controller
@RequestMapping("/approval_request")
public class ApprovalRequestsController {
	@Autowired
	private RequestService requestService;
	
	@Autowired
	private EmailService emailService;

	@GetMapping
	public String showApprovalRequests(Model model) {
		Map<Request,List<Vacation>> requests = requestService.getRequests();
		int maxDays =Constants.VACATION_DAYS;
		model.addAttribute("requests", requests);
		model.addAttribute("maxDays", maxDays);
		return "approval_request";

	}

	@PostMapping(value = "/approve",consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String approveRequest(@RequestBody Request request) {
     	requestService.approveRequest(request);
     	/* * * * * * * * * SEND EMAIL ABOUT APPROVING* * * * * * * * * * */
		String recepient = request.getRequestor().getEmail();
		String subject = "Wniosek zaakceptowany";
	    String content = "<p><b>Twój wniosek o urlop został zaakceptowany</b></p>"
	            + "<p>Informujemy, że twój wniosek o urlopie od: "+request.getVacation().getDate_from()
	            +" do: "+request.getVacation().getDate_to()+" został zaakceptowany przez użytkownika "+SecurityContextHolder.getContext().getAuthentication().getName()+".</p>"
	            + "<br>"
	            + "<p><b>HoustonHotel</b></p>";
		emailService.sendEmail(recepient, subject, content);
		return "success";
	}

	@PostMapping(value = "/reject",consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String rejectRequest(@RequestBody Request request) {
		if(request.getCommentary()=="" || request.getCommentary()==null) {
			return "Cannot reject without a commentary";
		}
    	requestService.rejectRequest(request);
    	/* * * * * * * * * SEND EMAIL ABOUT REJECTING* * * * * * * * * * */
		String recepient = request.getRequestor().getEmail();
		String subject = "Wniosek odrzucony";
	    String content = "<p><b>Twój wniosek o urlop został odrzucony</b></p>"
	            + "<p>Informujemy, że twój wniosek o urlopie od: "+request.getVacation().getDate_from()
	            +" do: "+request.getVacation().getDate_to()+" został odrzucony przez użytkownika "+SecurityContextHolder.getContext().getAuthentication().getName()+".</p>"
	            +"<p> Komentarz: "+request.getCommentary()+"</p>"
	            + "<br>"
	            + "<p><b>HoustonHotel</b></p>";
		emailService.sendEmail(recepient, subject, content);
		return "success";
	}

}
