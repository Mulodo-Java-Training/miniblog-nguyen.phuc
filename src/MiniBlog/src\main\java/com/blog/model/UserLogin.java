package com.blog.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity(name = "UserLogin")
@Table(name = "user")
public class UserLogin {

	@NotEmpty
	@Size(min = 4, max = 20)
	private String userName;

	@NotEmpty
	@Size(min = 4, max = 8)
	private String password;

	public String getPassword() {
		return password;
	}

	public String getUserName() {
		return userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
