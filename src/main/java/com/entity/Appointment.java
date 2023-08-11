package com.entity;

public class Appointment {

	
	private int id;
	private int userid;
	private int doctoreid;
	private String userName;
	private String gender;
	private String age;
	private String appointmentDate;
	private String email;
	private String phoneNo;
	private String diseases;
	private String address;
	private String status;
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Appointment(int userid, int doctoreid, String userName, String gender, String age, String appointmentDate,
			String email, String phoneNo, String diseases, String address, String status) {
		super();
		this.userid = userid;
		this.doctoreid = doctoreid;
		this.userName = userName;
		this.gender = gender;
		this.age = age;
		this.appointmentDate = appointmentDate;
		this.email = email;
		this.phoneNo = phoneNo;
		this.diseases = diseases;
		this.address = address;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getDoctoreid() {
		return doctoreid;
	}
	public void setDoctoreid(int doctoreid) {
		this.doctoreid = doctoreid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getDiseases() {
		return diseases;
	}
	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
}
	
