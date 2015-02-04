package com.blog.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.blog.dao.*;

;

@Controller
public class PostController {
	@Autowired
	private PostDao postDao;
	
	@RequestMapping("/")
	public String getListPost(Map<String, Object> map) {

		map.put("postList", postDao.getAllPost());
		return "index";
	}
	@RequestMapping("index")
	public String getHome(Map<String, Object> map) {

		map.put("postList", postDao.getAllPost());
		return "index";
	}


}
