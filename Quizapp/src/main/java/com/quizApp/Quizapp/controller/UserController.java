package com.quizApp.Quizapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quizApp.Quizapp.model.User;
import com.quizApp.Quizapp.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")

public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("user", new User());
        return "Signup";
    }
	 
    @PostMapping("/signup")
    public String signup(@ModelAttribute User user, Model model) {
        String response = userService.saveUserDetails(user.getUsername(), user.getEmail(), user.getPassword(), "USER");
        model.addAttribute("response", response);
        
        return "Login"; 
    }
	 
	 
	    @GetMapping("/login")
	    public String showLoginForm() {
	        return "Login";
	    }
	    
	    
	    @PostMapping("/login")
	    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
	        
	        User user = userService.userLogin(email, password);
	        
	        if (user != null) {
	            session.setAttribute("user", user.getUsername());
	            
	            if ("USER".equalsIgnoreCase(user.getRole())) {
	                return "redirect:/test/userDashboard"; 
	            } else {
	                return "redirect:/question/dashboard"; 
	            }
	        }
	        
	        model.addAttribute("error", "Invalid username or password");
	        return "Login"; 
	    }
	    
	    @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();
	        return "Login";
	    }

}
