package com.pjatk.controllers;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pjatk.helpers.EmpNotFoundException;
import com.pjatk.helpers.TokenNotFoundException;
import com.pjatk.models.Login;
import com.pjatk.service.EmpService;
/**
 * @author Yuliia Likhytska
 */
@Controller
@SessionAttributes("login")
public class LoginController {
	@Autowired
	private EmpService empService;

	@ModelAttribute("login")
	public Login setUpUserForm() {
		return new Login();
	}

	@GetMapping(value = "/unauthorized")
	public ModelAndView showUnauthorized(Model model) {
		ModelAndView mav = new ModelAndView("unauthorized");
		return mav;
	}

	@GetMapping(value = "/logout")
	public ModelAndView logout(Model model) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());
		return mav;
	}

	@GetMapping(value = "/login")
	public String showLogin(Model model) {
		model.addAttribute("login", new Login());
		return "login";
	}

	@GetMapping(value = "/userNotFound")
	public ModelAndView userNotFound(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView login = new ModelAndView("login");
		login.addObject("message", "Email lub hasło jest nieprawidłowe");
		return login;
	}

	@GetMapping(value = "/passwordNotChanged")
	public String passwordNotChanged() {
		return "forgot_password";
	}

	@PostMapping(value = "/login")
	public String login(@ModelAttribute Login login, Model model) {
		model.addAttribute("login", new Login());
		return "home";
	}

	@GetMapping(value = "/")
	public String redirectLogin(Model model) {
		return "redirect:/login";
	}

	@GetMapping(value = "/forgot_password")
	public String showForgotPasswordForm() {
		return "forgot_password";
	}

	@GetMapping(value = "/reset_password")
	public String showResetPasswordForm(@RequestParam(value = "token") String token, Model model) {

		try {
			if (!empService.validatePasswordResetToken(token)) {
				model.addAttribute("error", "Niepoprawny token");
				return "redirect:/unauthorized";
			}
		} catch (TokenNotFoundException e) {

			e.printStackTrace();
		}
		model.addAttribute("token", token);
		return "reset_password";
	}

	@GetMapping(value = "/token")
	public ModelAndView showMessage() {
		ModelAndView mav = new ModelAndView("password_helper");
		mav.addObject("message",
				"Jeśli użytkownik z takim mailem istnieję, otrzymałeś link to resetowania hasła w powiadomieniu mailowym");
		return mav;
	}

	@GetMapping(value = "/passwordChanged")
	public ModelAndView showPasswordChangedMessage() {
		ModelAndView mav = new ModelAndView("password_helper");
		mav.addObject("message", "Hasło zostało pomyślnie zmienione");
		return mav;
	}

	@PostMapping(value = "/sendPasswordReminder")
	public String resetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
		String email = request.getParameter("email").trim();
		if (email.equals("")) {
			model.addAttribute("error", "Pole adres mailowy nie może być puste");
			return "forgot_password";
		}

		String siteURL = request.getRequestURL().toString();

		try {
			String token = empService.setResetPasswordToken(email);
			String resetPasswordLink = siteURL.replace(request.getServletPath(), "") + "/reset_password?token=" + token;
			empService.sendEmail(email, resetPasswordLink);
		} catch (EmpNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/token";

	}

	@PostMapping(value = "/changePassword")
	public String changePassword(HttpServletRequest request, HttpServletResponse response, Model model)
			throws TokenNotFoundException {
		String password = request.getParameter("password");
		String repeatPassword = request.getParameter("password-repeat");
		String token = request.getParameter("token");
		String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,20}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(password);

		if (password == "") {
			model.addAttribute("errorPassword", "Pole hasło nie może być puste");
			return "reset_password";
		} else if (repeatPassword == "") {
			model.addAttribute("errorRepeatPassword", "Pole hasło nie może być puste");
			return "reset_password";
		} else if (!password.equals(repeatPassword)) {
			model.addAttribute("error", "Hasła różnią się");
			return "reset_password";
		} else if (!matcher.matches()) {
			model.addAttribute("error",
					"Hasło powinno zawierać przynajmniej 1 dużą, 1 malą literę i 1 liczbę. Długość hasła powinna być od 6 do 20 znaków.");
			return "reset_password";
		}

		Integer emp_id = empService.findByResetPasswordToken(token);

		String email = empService.updatePass(emp_id, password);
		try {
			empService.sendConfirmation(email);
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/passwordChanged";
	}

}
