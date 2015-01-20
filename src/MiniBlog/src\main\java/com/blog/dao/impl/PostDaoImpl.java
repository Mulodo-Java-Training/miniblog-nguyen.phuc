package com.blog.dao.impl;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blog.dao.PostDao;
import com.blog.model.Post;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Post> getAllPost() {
		return sessionFactory.getCurrentSession().createQuery("from post").list();
		
	}

}
