package com.blog.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.blog.model.User;
import com.blog.service.UserService;

@Controller
@SessionAttributes("user")
public class LoginController {

	
@Autowired
private UserService userService;
		
@RequestMapping(value="/signup", method=RequestMethod.GET)
public String signup(Model model) {
		User user = new User();		
		model.addAttribute("user", user);		
		return "signup";
	}
	
@RequestMapping(value="/signup", method=RequestMethod.POST)
public String signup(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {		
		if(result.hasErrors()) {
			return "signup";
		} else if(userService.findByUserName(user.getUserName())) {
			model.addAttribute("message", "User Name exists. Try another user name");
			return "signup";
		} else {
			userService.save(user);
			model.addAttribute("message", "Saved user details");
			return "redirect:login.html";
		}
	}

@RequestMapping(value="/login", method=RequestMethod.GET)
public String login(Model model) {			
		User userLogin = new User();		
		model.addAttribute("userLogin", userLogin);
		return "login-authori";
	}
	
@RequestMapping(value="/login", method=RequestMethod.POST)
public ModelAndView login(@Valid @ModelAttribute("userLogin") User userLogin, BindingResult result,ModelAndView model) {
			
			boolean found = userService.findByLogin(userLogin.getUserName(), userLogin.getPassWord());
			
			String log = String.format("user[%s][%s]", userLogin.getUserName(), userLogin.getPassWord());
			System.out.println(log);
			
			if (found) {	
				model.addObject("message","Login Success..");

				model.setViewName("login-authori");
				return model;
			} else {				
				
				model.addObject("message","Login False..Please try again.");
				model.setViewName("login-authori");
				return  model;
			}
		
		
	}

@RequestMapping(value="/failure", method=RequestMethod.GET)
public String loginFalse() {
		return "failure"; 
	}

@RequestMapping(value="/success", method=RequestMethod.GET)
public String loginSuccess() {
		return "success"; 
	}

public String helloWorld(Model model) {
    model.addAttribute("message", "Hello World!");
    return "helloWorld";
}

}
