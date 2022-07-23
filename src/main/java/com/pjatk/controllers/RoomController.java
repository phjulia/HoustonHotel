package com.pjatk.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.pjatk.models.Room;
import com.pjatk.service.RoomService;
/**
 * @author Yuliia Likhytska
 */
@Controller
@RequestMapping("/rooms")
public class RoomController {
	@Autowired
	private RoomService roomService;

	@GetMapping()
	public String showRooms(Model model, HttpServletRequest request, @RequestParam(required = false) String sort,
			@RequestParam(required = false) String direction) {
		return findPaginated(request, 0, "id", "asc", model);
	}

	@GetMapping("/{pageNo}")
	public String findPaginated(HttpServletRequest request, @PathVariable(value = "pageNo") int pageNo,
			@RequestParam(required = false,defaultValue="id") String sort, @RequestParam(required = false,defaultValue="asc") String direction,
			Model model) {
		int pageSize = 5;

		PageRequest pageable = PageRequest.of(pageNo, pageSize, Direction.fromString(direction), sort);
		Page<Room> page;
		if (request.getParameter("minPrice") != null && request.getParameter("maxPrice")!=null) {
			int minPrice=Integer.parseInt(request.getParameter("minPrice"));
			int maxPrice=Integer.parseInt(request.getParameter("maxPrice"));
			model.addAttribute("minPrice", minPrice);
			model.addAttribute("maxPrice", maxPrice);
			page = roomService.findAll(minPrice, maxPrice, pageable);

		} else {
			page = roomService.findAll(pageable);
		}
		List<Room> listRooms = page.getContent();

		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());

		model.addAttribute("sort", sort);
		model.addAttribute("direction", direction);
		
		model.addAttribute("reverseSortDirection", direction.equals("asc") ? "desc" : "asc");
		model.addAttribute("listRooms", listRooms);
		return "room_list";
	}

	@GetMapping(value = "/edit/{id}")
	public String showEditRoom(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		Room room = roomService.getRoom(id);
		model.addAttribute("room", room);

		return "edit_room";
	}

	@PostMapping(value = "/edit/{id}")
	public String editRoom(@Valid @ModelAttribute("room") Room room, BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			return "edit_room";
		}
		roomService.updateRoom(room);
		return "redirect:/rooms";
	}

}