package com.blog.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity(name="User")
@Table(name="user")
public class User {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO) //for autonumber
	private int userID;
	
	
	@Column(name="username")
	@NotEmpty
	@Size(min=4, max=20)
	 private String userName;
	
	
	@Column (name="password")
	@NotEmpty
	@Size(min=4, max=8)
	 private String passWord;
	
	
	@Column (name="firstname")
	@NotEmpty
	 private String firstName;
	
	
	@Column (name="lastname")
	 private String lastName;
	
	
	@Column 
	 private String avatar;
	@Column
	 private int gender;
	@Column
	@NotNull
	@Past
	@DateTimeFormat(pattern="MM/dd/yyyy")
	 private Date birthday;
	@Column
	 private String address;
	@Column
	 private String city;
	@Column
	 private String email;
	@Column
	 private String mobile;
	@Column
	 private int group=0;
	
	@Column (name="last_login")
	 private int lastLogin;
	@Column (name="login_hash")
	 private String loginHash;
	
	
	@Column (name="created_at")
	@Type(type="date")
	 private Date createAt;
	
	@Column (name="updated_at")
	@Type(type="date")
	 private Date updateAt;
	
	public User(){} 
	
 public User(int userID, String userName, String passWord, String firstName,
			String lastName, String avatar, int gender, Date birthday,
			String address, String city, String email, String mobile,
			int group, int lastLogin, String loginHash, Date createAt,
			Date updateAt) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.passWord = passWord;
		this.firstName = firstName;
		this.lastName = lastName;
		this.avatar = avatar;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.city = city;
		this.email = email;
		this.mobile = mobile;
		this.group = group;
		this.lastLogin = lastLogin;
		this.loginHash = loginHash;
		this.createAt = createAt;
		this.updateAt = updateAt;
}

public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getAvatar() {
	return avatar;
}
public void setAvatar(String avatar) {
	this.avatar = avatar;
}
public int getGender() {
	return gender;
}
public void setGender(int gender) {
	this.gender = gender;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public int getGroup() {
	return group;
}
public void setGroup(int group) {
	this.group = group;
}
public int getLastLogin() {
	return lastLogin;
}
public void setLastLogin(int lastLogin) {
	this.lastLogin = lastLogin;
}
public String getLoginHash() {
	return loginHash;
}
public void setLoginHash(String loginHash) {
	this.loginHash = loginHash;
}
public Date getCreateAt() {
	return createAt;
}
public void setCreateAt(Date createAt) {
	this.createAt = createAt;
}
public Date getUpdateAt() {
	return updateAt;
}
public void setUpdateAt(Date updateAt) {
	this.updateAt = updateAt;
}

 
 
}
