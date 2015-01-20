package com.blog.controller;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.blog.dao.*;;

@Controller
public class PostController
{
	@Autowired
	private PostDao postDao;
	@RequestMapping("/post")
	
	public String getListPost(Map<String, Object> map){
	
		map.put("userList", postDao.getAllPost());
		return "user";
	}


}
