package com.blog.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.model.User;
import com.blog.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@Autowired(required = true)
	
	@RequestMapping("/users")
	public String setupForm(Map<String, Object> map) {
		User user = new User();
		map.put("user", user);
		map.put("userList", userService.getAllUser());
		return "listUser";
	}

	@RequestMapping("/home/account/{username}")
	public String editUser(@PathVariable("username") String username,
			Model model, HttpServletRequest request) {
		User user = this.userService.getUserByUserName(username);
		model.addAttribute("userinfo", user);
		return "updateUser";
	}

	@RequestMapping(value = "/home/account/{username}", method = RequestMethod.POST)
	public String doeditUser(@ModelAttribute User user, BindingResult result,
			@RequestParam String action, Map<String, Object> map, Model model,
			HttpServletRequest request) {
		User userResult = new User();
		userService.edit(user);
		userResult = user;
		model.addAttribute("userinfo", userResult);
		return "updateUser";
	}

	@RequestMapping(value = "/user.do", method = RequestMethod.POST)
	public String doActions(@ModelAttribute User user, BindingResult result,
			@RequestParam String action, Map<String, Object> map) {
		User userResult = new User();
		switch (action.toLowerCase()) { // only in Java7 you can put String in
										// switch
		case "add":
			userService.add(user);
			userResult = user;
			break;
		case "edit":
			userService.edit(user);
			userResult = user;
			break;
		case "delete":
			userService.delete(user.getUserID());
			userResult = new User();
			break;
		case "search":
			User searchedUser = userService.getUser(user.getUserID());
			userResult = searchedUser != null ? searchedUser : new User();
			break;
		}
		map.put("user", userResult);
		map.put("userList", userService.getAllUser());
		return "user";
	}

	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public String listUsers(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("listUsers", this.userService.getAllUser());
		return "list";
	}



	@RequestMapping("/user/remove/{id}")
	public String removeUser(@PathVariable("id") int id) {

		this.userService.delete(id);
		return "redirect:/users";
	}

	@RequestMapping(value = "/user/changepassword", method = RequestMethod.GET)
	public String changePassword(Model model, HttpServletRequest request) {
		return "changePassword";
	}

	@RequestMapping(value = "/user/changepassword", method = RequestMethod.POST)
	public String changePassword(
			@RequestParam("currentpassword") String currentpassword,
			@RequestParam("newpassword") String newpassword, Model model,
			HttpServletRequest request) {

		logger.info("current_password  "
				+ request.getParameter("currentpassword"));
		String current_password = request.getParameter("currentpassword");
		String newpass = request.getParameter("newpassword");
		String re_newpass = request.getParameter("retypepassword");
		String error = "false";
		if (!(current_password.isEmpty() || (newpass.isEmpty()) || (re_newpass
				.isEmpty()))) {
			String username = (String) request.getSession().getAttribute(
					"user_loged_in");
			User user = this.userService.getUserByUserName(username);

			if (user != null) {
				logger.info("re_newpass  " + re_newpass);
				if (newpass.equals(re_newpass)) {
					if (current_password.equals(user.getPassWord())) {

						user.setPassWord(newpass);
						this.userService.edit(user);
					} else {
						error = "Current password is not correct";
					}
				} else {
					error = "Retype password is not match";
				}

			} else {
				error = "user not exist";
			}
		} else {
			error = "All input must be filled";
		}
		model.addAttribute("error", error);
		return "changePassword";
	}

}