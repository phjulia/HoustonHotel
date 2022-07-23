package com.pjatk.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pjatk.models.Emp;
import com.pjatk.service.EmpService;

/**
 * @author Yuliia Likhytska
 */

@Controller
public class EmployeeController {
	@Autowired
	private EmpService empService;

	@GetMapping("/employees")
	public String getEmployees(Model model, HttpServletRequest request,
			@RequestParam(required = false) String sort,@RequestParam(required=false) String direction) {
		return findPaginated(request,0, "id", "asc", model);
	}
	@GetMapping("/employees/{pageNo}")
	public String findPaginated(HttpServletRequest request,@PathVariable (value = "pageNo") int pageNo, 
			@RequestParam(required = false,defaultValue="id") String sort,
			@RequestParam(required=false,defaultValue="asc") String direction,
			Model model) {
		int pageSize = 10;
		
		PageRequest pageable = PageRequest.of(pageNo, pageSize, Direction.fromString(direction), sort);
		Page<Emp> page;
		model.addAttribute("jobs", empService.getAllJobs());
		if (request.getParameter("job") != null) {
			page = empService.findAll(request.getParameter("job"),pageable);
			model.addAttribute("job", request.getParameter("job"));
		}else {
			page = empService.findAll(pageable);
		}
		List<Emp> listEmployees = page.getContent();
		
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		
		model.addAttribute("sort", sort);
		model.addAttribute("direction", direction);
		model.addAttribute("reverseSortDirection", direction.equals("asc")?"desc":"asc");
		
		model.addAttribute("listEmployees", listEmployees);

		return "employee_list";
	}

	@GetMapping("/add_employee")
	public String showAddEmp(Model model) {
		model.addAttribute("emp", new Emp());
		model.addAttribute("jobs",empService.getAllJobs());
		return "add_employee";
	}

	@PostMapping("/add_employee")
	public String addEmp(@Valid @ModelAttribute("emp") Emp emp,BindingResult bindingResult,HttpServletRequest request, Model model) {
		 if("0".equals(emp.getJob())){
			 bindingResult.addError(new FieldError("emp","job","Wybierz stanowisko"));
		   }
		if (bindingResult.hasErrors()) {
	        return "add_employee";
	    }
		try {
		
			/* * * * * * * * * CHECK IF AN EMP WITH SUCH PESEL/EMAIL ALREADY EXISTS * * * */
			if (empService.findByPesel(emp.getPesel()) != 0) {
				bindingResult.addError(new FieldError("emp","pesel","Użytkownik z takim numerem PESEL już istnieje"));
				return "add_employee";
			}else if(empService.findByEmail(emp.getEmail()) != 0) {
				bindingResult.addError(new FieldError("emp","email","Użytkownik z takim adresem email już istnieje"));
				return "add_employee";
			}

			emp.setAddress(emp.getInputAddress() + " " + emp.getInputCity() + " " + emp.getInputZip());
			empService.addEmp(emp);
			String siteURL = request.getRequestURL().toString();
			
			empService.sendAccountCreatedEmail(emp.getEmail(),
					siteURL.replace(request.getServletPath(), "") + "/forgot_password");
			;
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();

		}
		return "redirect:/employees";
	}

	@GetMapping(value = "/employee/{id}")
	public String showEditEmployee(@PathVariable int id, Model model) {
		Emp emp = empService.getEmp(id);
		model.addAttribute("emp", emp);
		return "edit_employee";
	}

	@PostMapping("employee/edit")
	public String editEmployee(@ModelAttribute("emp") Emp emp) {
		empService.updateEmp(emp);
		return "redirect:/employees";
	}


}
