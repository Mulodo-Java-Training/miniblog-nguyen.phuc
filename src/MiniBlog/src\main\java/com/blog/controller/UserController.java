package com.blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.blog.model.User;
import com.blog.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);


	private static final long limit_avatar = 500;

	private ServletContext servletContext;
	@Autowired(required=true)
	@Qualifier(value="servletContext")
	public void setServletContext(ServletContext servletContext) {
	this.servletContext = servletContext;
	}
	
	@RequestMapping("/users")
	public String setupForm(Map<String, Object> map){
		User user = new User();
		map.put("user", user);
		map.put("userList", userService.getAllUser());
		return "list-user";
	}
	@RequestMapping("/home/account/{username}")
	public String editUser(@PathVariable("username") String username, Model model,HttpServletRequest request){
		User user = this.userService.getUserByUserName(username);
	//model.addAttribute("limit_avatar", limit_avatar );
	    model.addAttribute("userinfo", user );
	    return "update-user-info";
	}
	@RequestMapping(value="/home/account/{username}", method=RequestMethod.POST)
	public String doeditUser(@ModelAttribute User user, BindingResult result, @RequestParam String action, Map<String, Object> map, Model model,HttpServletRequest request){
		User userResult = new User();
		userService.edit(user);
		userResult = user;
		model.addAttribute("userinfo", userResult );
	    return "update-user-info";
	}
	
	@RequestMapping(value="/user.do", method=RequestMethod.POST)
	public String doActions(@ModelAttribute User user, BindingResult result, @RequestParam String action, Map<String, Object> map){
		User userResult = new User();
		switch(action.toLowerCase()){	//only in Java7 you can put String in switch
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
			userResult = searchedUser!=null ? searchedUser : new User();
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
	 
	//For add and update person both
	@RequestMapping(value= "/user/add", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("userinfo") User p,Model model,@RequestParam(value = "imagelink", required = false) MultipartFile image,HttpServletRequest request){
	    
		
		String username = p.getUserName();
		User user = this.userService.getUserByUserName(username);
	    if(user ==null){
	        //new person, add it
	        this.userService.add(p);
	    }else{
	    	
	    	if(!user.getAvatar().equals(image.getOriginalFilename())){
	    		if(image.getSize()<limit_avatar){
	    		try {
	        	
	        		String nameImageNew = user.getUserName() +image.getOriginalFilename();
	        		
	        		saveImage(nameImageNew, image);
	        		user.setAvatar(nameImageNew);
	        	} catch (IOException e) {
//	        		bindingResult.reject(e.getMessage());
	        		model.addAttribute("error","true");
	        		return "updateUserInfo";
	        	}
	    		}else{
	    			model.addAttribute("error","Size of image should < "+limit_avatar+" byte");
	        		return "updateUserInfo";
	    		}
	       		
	    	}
	    	
	    	
	        //existing person, call update
	    	user.setAddress(p.getAddress());
	    	user.setEmail(p.getEmail());
	    	user.setFirstName(p.getFirstName());
	    	user.setLastName(p.getLastName());
	        this.userService.edit(user);
	        model.addAttribute("userinfo",user);
	        model.addAttribute("error","false");
	    }
	     
	    return "updateUserInfo";
	     
	}
	private void saveImage(String filename, MultipartFile image)
			throws RuntimeException, IOException {
		try {
			logger.info("function  ");
			String webappRoot = servletContext.getRealPath("/");
		    String relativeFolder = "/resources/avatar/" ;
		    String realPath = webappRoot + relativeFolder
		                       + filename;
//			String realPath = servletContext.getRealPath(filename);
		File file = new File(realPath);
		logger.info("saveImage  "+file.getAbsolutePath());
		logger.info("realPath  "+realPath);
		FileUtils.writeByteArrayToFile(file, image.getBytes());
		System.out.println("Go to the location:  " + file.toString()
		+ " on your computer and verify that the image has been stored.");
		} catch (IOException e) {
		throw e;
		}
	}

	@RequestMapping("/user/remove/{id}")
	public String removeUser(@PathVariable("id") int id){
	     
	    this.userService.delete(id);
	    return "redirect:/users";
	}


	@RequestMapping(value= "/user/changepassword", method = RequestMethod.GET)
	public String changePassword(Model model,HttpServletRequest request){
	    return "changePassword";
	}
	@RequestMapping(value= "/user/changepassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam("currentpassword") String currentpassword,@RequestParam("newpassword") String newpassword, Model model,HttpServletRequest request){
		
		logger.info("current_password  "+request.getParameter("currentpassword"));
		String current_password = request.getParameter("currentpassword");
		String newpass = request.getParameter("newpassword");
		String re_newpass = request.getParameter("retypepassword");
		String error = "false";
		if(!(current_password.isEmpty()||(newpass.isEmpty())||(re_newpass.isEmpty())))
		{
		String username = (String)request.getSession().getAttribute("user_loged_in");
		User user = this.userService.getUserByUserName(username);
		
			if (user!=null){
				logger.info("re_newpass  "+re_newpass);
				if(newpass.equals(re_newpass)){
					if (current_password.equals(user.getPassWord())){
	    				
	    				user.setPassWord(newpass);
	    				this.userService.edit(user);
	    			}else{
	    				error = "Current password is not correct";
	    			}
				}else{
					error = "Retype password is not match";
				}
				
			
	    	}else{
	    		error = "user not exist";
	    	}
		}else{
			error = "All input must be filled";
		}
		model.addAttribute("error", error );
	    return "changePassword";
	}

	

}