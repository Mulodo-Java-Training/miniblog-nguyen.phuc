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

@Entity(name = "User")
@Table(name = "user")
public class User {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	// for autonumber
	private int id;

	@Column
	@NotEmpty
	//@Size(min = 4, max = 20)
	private String username;
	
	@Column
	@NotEmpty
	//@Size(min = 4, max = 8)
	private String password;
	
	@Column
	@NotEmpty
	private String firstname;
	
	@Column
	private String lastname;

	@Column
	private String avatar;
	@Column
	private int gender;
	@Column
	@NotNull
	@Past
	@DateTimeFormat(pattern = "MM/dd/yyyy")
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
	private int group_user = 0;

	@Column(name = "last_login")
	private int lastLogin;
	
	@Column(name = "login_hash")
	private String login_hash;

	@Column(name = "created_at")
	@Type(type = "date")
	private Date created_at;

	@Column(name = "updated_at")
	@Type(type = "date")
	private Date updated_at;

	public User() {
	}

	public User(int userID, String username, String password, String firstname,
			String lastname, String avatar, int gender, Date birthday,
			String address, String city, String email, String mobile,
			int group, int lastLogin, String loginHash, Date createAt,
			Date updateAt) {
		super();
		this.id = userID;
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.avatar = avatar;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.city = city;
		this.email = email;
		this.mobile = mobile;
		this.group_user = group;
		this.lastLogin = lastLogin;
		this.login_hash = loginHash;
		this.created_at = createAt;
		this.updated_at = updateAt;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int _id) {
		this.id = _id;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the firstname
	 */
	public String getFirstname() {
		return firstname;
	}

	/**
	 * @param firstname the firstname to set
	 */
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	/**
	 * @return the lastname
	 */
	public String getLastname() {
		return lastname;
	}

	/**
	 * @param lastname the lastname to set
	 */
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	/**
	 * @return the avatar
	 */
	public String getAvatar() {
		return avatar;
	}

	/**
	 * @param avatar the avatar to set
	 */
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	/**
	 * @return the gender
	 */
	public int getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(int gender) {
		this.gender = gender;
	}

	/**
	 * @return the birthday
	 */
	public Date getBirthday() {
		return birthday;
	}

	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the group
	 */
	public int getGroup_user() {
		return group_user;
	}

	/**
	 * @param group the group to set
	 */
	public void setGroup_user(int group) {
		this.group_user = group;
	}

	/**
	 * @return the lastLogin
	 */
	public int getLastLogin() {
		return lastLogin;
	}

	/**
	 * @param lastLogin the lastLogin to set
	 */
	public void setLastLogin(int lastLogin) {
		this.lastLogin = lastLogin;
	}

	/**
	 * @return the login_hash
	 */
	public String getLogin_hash() {
		return login_hash;
	}

	/**
	 * @param login_hash the login_hash to set
	 */
	public void setLogin_hash(String login_hash) {
		this.login_hash = login_hash;
	}

	/**
	 * @return the created_at
	 */
	public Date getCreated_at() {
		return created_at;
	}

	/**
	 * @param created_at the created_at to set
	 */
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	/**
	 * @return the updated_at
	 */
	public Date getUpdated_at() {
		return updated_at;
	}

	/**
	 * @param updated_at the updated_at to set
	 */
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", firstname=" + firstname + ", lastname="
				+ lastname + ", avatar=" + avatar + ", gender=" + gender
				+ ", birthday=" + birthday + ", address=" + address + ", city="
				+ city + ", email=" + email + ", mobile=" + mobile
				+ ", group_user=" + group_user + ", lastLogin=" + lastLogin
				+ ", login_hash=" + login_hash + ", created_at=" + created_at
				+ ", updated_at=" + updated_at + "]";
	}


}
