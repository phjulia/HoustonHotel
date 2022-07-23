package com.pjatk.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pjatk.models.Vacation;
import com.pjatk.service.CalendarService;

/**
 * @author Yuliia Likhytska
 *
 */

@Controller
@RequestMapping("/vacations")
public class VacationsController {
	
	@Autowired
	private CalendarService calendarService;
	
	@GetMapping(value="/get", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<Vacation>> getVacations(Model model,HttpServletRequest request, HttpServletResponse response) {
		List<Vacation> vacations =calendarService.getAllVacations();
		return new ResponseEntity<List<Vacation>>(vacations,HttpStatus.OK);
	}
	@GetMapping()
	public String showVacations(Model model,HttpServletRequest request, HttpServletResponse response) {
		return "vacation_list";
	}
	@PostMapping()
	public String showVacationsFiltered(Model model,HttpServletRequest request, HttpServletResponse response) {
		List<Vacation> vacationsFiltered =calendarService.getFilteredVacations(request.getParameter("dateFrom"),request.getParameter("dateTo"));
		model.addAttribute("vacationsFiltered",vacationsFiltered);
		return "vacations_filtered";
	}

}