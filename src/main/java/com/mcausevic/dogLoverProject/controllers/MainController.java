package com.mcausevic.dogLoverProject.controllers;


import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

import java.io.IOException;
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

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mcausevic.dogLoverProject.models.Comment;
import com.mcausevic.dogLoverProject.models.Playdate;
import com.mcausevic.dogLoverProject.models.User;
import com.mcausevic.dogLoverProject.models.Weather;
import com.mcausevic.dogLoverProject.services.CommentService;
import com.mcausevic.dogLoverProject.services.PlaydateService;
import com.mcausevic.dogLoverProject.services.UserService;
import com.mcausevic.dogLoverProject.validator.UserValidator;

import okhttp3.Call;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;


@Controller
public class MainController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final PlaydateService playdateService;
	private final CommentService commentService;
	public MainController(UserService userService, UserValidator userValidator, PlaydateService playdateService, CommentService commentService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.playdateService = playdateService;
		this.commentService = commentService;
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
	public String dashboard(Model model, HttpSession session, RedirectAttributes redirect) throws IOException {
		if (session.getAttribute("weather") == null) {
			session.setAttribute("weather", null);
		}
		Weather thisWeather = (Weather) session.getAttribute("weather");
		model.addAttribute("weather", thisWeather);
		Long userId = (Long)session.getAttribute("userId");
		User user = userService.findUserById(userId);
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please register or login!");
			return "redirect:/";
		}
		OkHttpClient client = new OkHttpClient();
		
		    HttpUrl.Builder urlBuilder 
		      = HttpUrl.parse("http://api.openweathermap.org/data/2.5/weather?").newBuilder();
		    urlBuilder.addQueryParameter("q", user.getCity());
		    urlBuilder.addQueryParameter("units", "imperial");
		    urlBuilder.addQueryParameter("appid", "0c03e69d11eeb6257ebea29c1471329d");
		    String url = urlBuilder.build().toString();

		    Request request = new Request.Builder()
		      .url(url)
		      .build();
		    Call call = client.newCall(request);
		    Response response = call.execute();
		    assertThat(response.code(), equalTo(200));
		    String weatherInfo = response.body().string();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		Weather weather = mapper.readValue(weatherInfo, Weather.class);
		response.close();
		System.out.println(weatherInfo);
		
		session.setAttribute("weather", weather);
		model.addAttribute("user", userService.findUserById(userId));
		model.addAttribute("allPlaydates", playdateService.allPlaydates());
		model.addAttribute("allComments", commentService.allComments());
		return "dashboard.jsp";
	}
	
//	@RequestMapping("/testing")
//	public String weather(Model model) throws IOException {
//		OkHttpClient client = new OkHttpClient();
//		
//		    HttpUrl.Builder urlBuilder 
//		      = HttpUrl.parse("http://api.openweathermap.org/data/2.5/weather/?" + "/ex/bars").newBuilder();
//		    urlBuilder.addQueryParameter("q", "tulsa");
//		    urlBuilder.addQueryParameter("units", "imperial");
//		    urlBuilder.addQueryParameter("appid", "0c03e69d11eeb6257ebea29c1471329d");
//		    
//		    String url = urlBuilder.build().toString();
//
//		    Request request = new Request.Builder()
//		      .url(url)
//		      .build();
//		    Call call = client.newCall(request);
//		    Response response = call.execute();
//		    System.out.println(response.body().string());
//		    assertThat(response.code(), equals(200));
//		
//		return "redirect:/dashboard";
//	}
	
	@PostMapping("/createMessage")
	public String createComment(@RequestParam("content") String content, HttpSession session) {
		Comment comment = new Comment();
		User user = userService.findUserById((Long) session.getAttribute("userId"));
		comment.setContent(content);
		comment.setPostedBy(user);
		Comment newComment = commentService.createComment(comment);
		List <Comment> allComments = commentService.allComments();
		allComments.add(newComment);
		return "redirect:/dashboard";
	}
	
//***************************************
//	Checkout/Create Playdate(s)
//***************************************
	
	@RequestMapping("/playdates")
	public String playdates(Model model, HttpSession session) {
		model.addAttribute("playdate", new Playdate());
		model.addAttribute("allPlaydates", playdateService.allPlaydates());
		model.addAttribute("user", userService.findUserById((Long)session.getAttribute("userId")));
		return "playdates.jsp";
	}
	
	@RequestMapping("/createPlaydate")
	public String createPlaydates(@Valid @ModelAttribute("playdate") Playdate playdate, BindingResult result, Model model, HttpSession session) {
		User user = userService.findUserById((Long) session.getAttribute("userId"));
		model.addAttribute("playdate", new Playdate());
		return "createPlaydate.jsp";
	}
	
	@PostMapping("/createPlaydate")
	public String createPlaydate(@Valid @ModelAttribute("playdate") Playdate playdate, BindingResult result) {
		if (result.hasErrors()) {
			return "createPlaydate.jsp";
		} else {
			playdateService.createPlaydate(playdate);
			return "redirect:/playdates";
		}
	}
	
	// DELETE IDEA METHOD
    @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
    public String deleteOnePlaydate(@PathVariable ("id") Long playdate_id) {
        playdateService.deletePlaydate(playdate_id);
        return "redirect:/playdates";
    }
	
//***************************************
//	Join/Cancel Playdate
//***************************************
    
    @RequestMapping("/playdates/addUser/{id}")
    public String joinPlaydate(HttpSession session, @PathVariable ("id") Long id) {
        Long userId = (Long) session.getAttribute("userId");
        User u = userService.findUserById(userId);
        Playdate playdate =  playdateService.findPlaydate(id);
        List<User> attendees = playdate.getAttendees();
        attendees.add(u);
        playdate.setAttendees(attendees);
        playdateService.updatePlaydate(playdate);
            return "redirect:/playdates";
    }
    
    @RequestMapping("/playdates/removeUser/{id}")
    public String cancelPlaydate(HttpSession session, @PathVariable ("id") Long id) {
        Long userId = (Long) session.getAttribute("userId");
        User u = userService.findUserById(userId);
        Playdate playdate =  playdateService.findPlaydate(id);
        List<User> attendees = playdate.getAttendees();
        for(int i=0; i<attendees.size(); i++) {
            if(attendees.get(i).getId()== u.getId()){
                attendees.remove(i);
            }
        }
            playdate.setAttendees(attendees);
            playdateService.updatePlaydate(playdate);
                return "redirect:/playdates";
        }
   
//***************************************
//	Edit Playdate
//***************************************
        
    @RequestMapping("/playdates/{id}/edit") 
    public String editPlaydate(@PathVariable ("id") Long id, Model model, HttpSession session, RedirectAttributes redirectAttr) {
        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            redirectAttr.addFlashAttribute("please", "You MUST Register or Login before entering our site!");
            return "redirect:/";
        }
        model.addAttribute("playdate", playdateService.findPlaydate(id));
        return "edit.jsp";
    }
    
    @RequestMapping(value="/playdates/edit/{id}", method=RequestMethod.PUT)
    public String updatePlaydate(@Valid @ModelAttribute("playdate") Playdate playdate, BindingResult result) {
        if(result.hasErrors()) {
            return "edit.jsp";
        }else {
            playdateService.updatePlaydate(playdate);
            return "redirect:/playdates";
        }
    }
	
//***************************************
//	Logout
//***************************************
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/mydog/{id}")
	public String viewDog(@PathVariable("id") Long id, Model model, HttpSession session) {
		User user = userService.findUserById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		
		return "profile.jsp";
	}
	
	
	
	
	
}
