package com.blog.dao;

import java.util.List;

import com.blog.model.User;

public interface UserDao {
	public void add(User user);
	public void edit(User user);
	public void delete(int userId);
	public User getUser(int userId);
	public List<User> getAllUser();
	public User findByUserName(String userName);
	
	
}
