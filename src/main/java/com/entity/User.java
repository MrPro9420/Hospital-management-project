package com.entity;

public class User {
	
	private int Id;
	private String Fullname;
	private String Email;
	private String Password;
	
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User( String fullname, String email, String password) {
		super();
		Fullname = fullname;
		Email = email;
		Password = password;
	}
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getFullname() {
		return Fullname;
	}
	public void setFullname(String fullname) {
		Fullname = fullname;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	

}
