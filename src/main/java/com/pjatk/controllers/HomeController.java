package com.pjatk.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pjatk.service.HomeService;
/**
 * @author Yuliia Likhytska
 */

@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	@GetMapping(value="/home")
	public String home(Model model) {
			model.addAttribute("thisMonth",homeService.getBookingsCountThisMonth());
			model.addAttribute("lastMonth",homeService.getBookingsCountLastMonth());
			model.addAttribute("latestBookings",homeService.getLatestBookings());
			model.addAttribute("occupiedRooms",homeService.getOccupiedRooms());
			model.addAttribute("inactiveRooms", homeService.getInactiveRooms());
			model.addAttribute("availableRooms",homeService.getAvailableRooms());
			model.addAttribute("allBookings",homeService.getAllBookingsCount());
		return "home";
	}
}
