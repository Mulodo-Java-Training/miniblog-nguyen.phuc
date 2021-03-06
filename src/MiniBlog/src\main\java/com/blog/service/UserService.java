package com.blog.service;
import java.util.List;

import com.blog.model.User;

public interface UserService {
	public void add(User user);
	public void edit(User user);
	public void delete(int userId);
	public User getUser(int userId);
	public List<User> getAllUser();
	public void save(User user);
	boolean findByLogin(String userName, String password);
	boolean findByUserName(String userName);
	User getUserByUserName(String userName);

}
