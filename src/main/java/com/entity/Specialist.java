package com.entity;

public class Specialist {
	
	private int Sps_Id;
	private String Sps_Name;
	public Specialist(int sps_Id, String sps_Name) {
		super();
		Sps_Id = sps_Id;
		Sps_Name = sps_Name;
	}
	public Specialist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSps_Id() {
		return Sps_Id;
	}
	public void setSps_Id(int sps_Id) {
		Sps_Id = sps_Id;
	}
	public String getSps_Name() {
		return Sps_Name;
	}
	public void setSps_Name(String sps_Name) {
		Sps_Name = sps_Name;
	}
	
	

}
