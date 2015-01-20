package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blog.dao.UserDao;
import com.blog.model.User;
import com.blog.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Transactional
	public void add(User user) {
		userDao.add(user);
	}

	@Transactional
	public void edit(User user) {
		userDao.edit(user);
	}

	@Transactional
	public void delete(int userId) {
		userDao.delete(userId);
	}

	@Transactional
	public User getUser(int userId) {
		return userDao.getUser(userId);
	}

	@Transactional
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}



	@Transactional
	public void save(User user) {
		// TODO Auto-generated method stub
		
			userDao.add(user);
		
		
	}
	
	public boolean findByLogin(String userName, String password) {	
		User stud = userDao.findByUserName(userName);
		
		if(stud != null && stud.getPassWord().equals(password)) {
			return true;
		} 
		
		return false;		
	}

	public boolean findByUserName(String userName) {
		User stud = userDao.findByUserName(userName);
		
		if(stud != null) {
			return true;
		}
		
		return false;
	}

}
