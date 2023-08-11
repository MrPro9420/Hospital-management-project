package com.entity;

public class Doctore {

	
	private int id;
	private String fullname;
	private String dob;
	private String qualification;
	private String specialist_type;
	private String email;
	private String mobno;
	private String password;
	public Doctore() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Doctore(String fullname, String dob, String qualification, String specialist_type, String email,
			String mobno, String password) {
		super();
		this.fullname = fullname;
		this.dob = dob;
		this.qualification = qualification;
		this.specialist_type = specialist_type;
		this.email = email;
		this.mobno = mobno;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialist_type() {
		return specialist_type;
	}
	public void setSpecialist_type(String specialist_type) {
		this.specialist_type = specialist_type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
