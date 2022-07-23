package com.pjatk.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pjatk.models.Vacation;
import com.pjatk.service.CalendarService;

/**
 * @author Yuliia Likhytska
 *
 */

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	@Autowired
	private CalendarService calendarService;

	@GetMapping()
	public String showCalendar(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("approvedVacations", calendarService.getApprovedVacations(authentication.getName()));
		model.addAttribute("daysLeft", calendarService.getVacationDays(authentication.getName()));
		model.addAttribute("vacations", calendarService.getVacations(authentication.getName()));
		model.addAttribute("loggedUser", authentication.getName());
		
		return "calendar";
	}
	@GetMapping(value="/get", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<Vacation>> getVacations(Model model,HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<Vacation> vacations =calendarService.getVacations(authentication.getName());
		return new ResponseEntity<List<Vacation>>(vacations,HttpStatus.OK);
	}

	@RequestMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String addVacation(@RequestBody Vacation vacation) {
		
		calendarService.addVacation(vacation);
		return "success";
	}

	@RequestMapping(value = "/revoke", consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String revokeVacation(@RequestBody Vacation vacation) {
		
		calendarService.removeVacation(vacation);
		return "success";
	}

}
