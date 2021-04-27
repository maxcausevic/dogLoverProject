package com.mcausevic.dogLoverProject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcausevic.dogLoverProject.models.Playdate;
import com.mcausevic.dogLoverProject.models.User;
import com.mcausevic.dogLoverProject.services.PlaydateService;
import com.mcausevic.dogLoverProject.services.UserService;
import com.mcausevic.dogLoverProject.validator.UserValidator;


@Controller
public class MainController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final PlaydateService playdateService;
	public MainController(UserService userService, UserValidator userValidator, PlaydateService playdateService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.playdateService = playdateService;
	}
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("user", new User());
		return "index.jsp";
	}
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,RedirectAttributes redirect){
		  userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "index.jsp";
		}else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			redirect.addFlashAttribute("success", "You have successfully registered!");

			return "redirect:/dashboard";
		}
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model Model, HttpSession session, RedirectAttributes redirect) {
		if (userService.authenticateUser(email, password)) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			redirect.addFlashAttribute("success", "You have successfully logged in!");
			return "redirect:/dashboard";
		}else {
			redirect.addFlashAttribute("error", "Invalid login Credentials!");
			return "redirect:/";
		}
	}
	@RequestMapping("/dashboard")
	public String dashboard(Model model, HttpSession session, RedirectAttributes redirect) {
		Long userId = (Long)session.getAttribute("userId");
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please register or login!");
			return "redirect:/";
		}
		model.addAttribute("user", userService.findUserById(userId));
		model.addAttribute("allPlaydates", playdateService.allPlaydates());
		
		return "dashboard.jsp";
	}
	
//***************************************
//	Checkout/Create Playdate(s)
//***************************************
	
	@RequestMapping("/playdates")
	public String playdates(Model model) {
		model.addAttribute("playdate", new Playdate());
		return "playdates.jsp";
	}
	
	@PostMapping("/createPlaydate")
	public String createPlaydate(@Valid @ModelAttribute("playdate") Playdate playdate, BindingResult result) {
		if (result.hasErrors()) {
			return "createPlaydates.jsp";
		} else {
			playdateService.createPlaydate(playdate);
			return "redirect:/playdates";
		}
	}
	
//***************************************
//	Join/Cancel Playdate
//***************************************

	@PostMapping("/playdates/addUser/{playdate_id}")
	 public String addUser(@PathVariable("playdate_id") Long playdate_id, HttpSession session) {
		Playdate playdate = playdateService.findPlaydate(playdate_id);
		User user = userService.findUserById((Long) session.getAttribute("userId"));
		List <User> uInPlaydates = playdate.getAttendees();
		uInPlaydates.add(user);
		playdateService.updatePlaydate(playdate);
		return "redirect:/playdates";
	}
	
	@PostMapping("/playdates/removeUser/{playdate_id}") 
		public String removeUser(@PathVariable("playdate_id") Long playdate_id, HttpSession session) {
		Playdate playdate = playdateService.findPlaydate(playdate_id);
		User user = userService.findUserById((Long) session.getAttribute("userId"));
		List <User> uInPlaydates = playdate.getAttendees();
		uInPlaydates.remove(user);
		playdateService.updatePlaydate(playdate);
		return "redirect:/playdates";
	}

	
//***************************************
//	Logout
//***************************************
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
