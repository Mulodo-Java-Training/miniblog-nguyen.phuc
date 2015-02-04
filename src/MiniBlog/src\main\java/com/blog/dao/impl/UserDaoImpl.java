package com.blog.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.dao.UserDao;
import com.blog.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void edit(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public void delete(int userId) {
		sessionFactory.getCurrentSession().delete(getUser(userId));
	}

	@Override
	public User getUser(int userId) {
		return (User) sessionFactory.getCurrentSession()
				.get(User.class, userId);
	}

	@Transactional
	public User findByUserName(String userName) {

		User usr = (User) sessionFactory.getCurrentSession()
				.createQuery("select s from User s where s.userName = ?")
				.setParameter(0, userName).uniqueResult();

		if (usr != null) {
			return usr;
		}

		return null;
	}

	@Override
	public List<User> getAllUser() {
		return sessionFactory.getCurrentSession().createQuery("from User")
				.list();
	}

}
