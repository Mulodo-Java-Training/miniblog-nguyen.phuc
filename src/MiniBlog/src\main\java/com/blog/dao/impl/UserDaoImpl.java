package com.blog.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.dao.UserDao;
import com.blog.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired

	private SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	 public void setSessionFactory(SessionFactory sf){
	        this.sessionFactory = sf;
	    }
	 

	@Override
	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void edit(User user) {
		    logger.info("User Email [ "+user.getEmail() + "]");
	        Session session = this.sessionFactory.getCurrentSession();
	        System.out.println("-----------------------------------"+user.getBirthday());
	    	     session.update(user);
//	       }catch (Exception e){
//	    	   logger.error(e.toString());
//	    	   e.printStackTrace();
//	       }
	       logger.info("Person updated successfully, Person Details="+user);
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
	public User findByUserName(String username) {

		User usr = (User) sessionFactory.getCurrentSession()
				.createQuery("select s from User s where s.username = ?")
				.setParameter(0, username).uniqueResult();

		if (usr != null) {
			return usr;
		}

		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUser() {
		return sessionFactory.getCurrentSession().createQuery("from User")
				.list();
	}

}
