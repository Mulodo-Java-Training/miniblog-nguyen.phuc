package com.blog.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.dao.PostDao;
import com.blog.model.Post;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Post> getAllPost() {
		List<Post> list = sessionFactory.getCurrentSession()
				.createQuery("from Post").list();
		return list;

	}

}
