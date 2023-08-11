package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDAO {

	private Connection con;

	public AppointmentDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addApointment(Appointment ap) {
		boolean f = false;
		
		try {
			
			String sql = "insert into appointment(user_id, doc_id, fullname, gender, age, appointment_date, email, phoneno, diseases, address, status)values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ap.getUserid());
			ps.setInt(2, ap.getDoctoreid());
			ps.setString(3, ap.getUserName());
			ps.setString(4, ap.getGender());
			ps.setString(5, ap.getAge());
			ps.setString(6, ap.getAppointmentDate());
			ps.setString(7, ap.getEmail());
			ps.setString(8, ap.getPhoneNo());
			ps.setString(9, ap.getDiseases());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			
			if(ps.executeUpdate()==1) {
				f=true;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Appointment> getAllApointByUserId(int userId){
		List<Appointment> list = new ArrayList<>();
		Appointment ap= null;
		
		try {
			
			String sql = "select * from appointment where user_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setDoctoreid(rs.getInt(3));
				ap.setUserName(rs.getString(4));
				ap.setGender(rs.getString(5));
				ap.setAge(rs.getString(6));
				ap.setAppointmentDate(rs.getString(7));
				ap.setEmail(rs.getString(8));
				ap.setPhoneNo(rs.getString(9));
				ap.setDiseases(rs.getString(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				list.add(ap);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public List<Appointment> getAllApointByDoctoreId(int docId){
		List<Appointment> list = new ArrayList<>();
		Appointment ap= null;
		
		try {
			
			String sql = "select * from appointment where doc_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, docId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setDoctoreid(rs.getInt(3));
				ap.setUserName(rs.getString(4));
				ap.setGender(rs.getString(5));
				ap.setAge(rs.getString(6));
				ap.setAppointmentDate(rs.getString(7));
				ap.setEmail(rs.getString(8));
				ap.setPhoneNo(rs.getString(9));
				ap.setDiseases(rs.getString(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				list.add(ap);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public Appointment getAllApointByAppointmentId(int Id){
		
		Appointment ap= null;
		
		try {
			
			String sql = "select * from appointment where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setDoctoreid(rs.getInt(3));
				ap.setUserName(rs.getString(4));
				ap.setGender(rs.getString(5));
				ap.setAge(rs.getString(6));
				ap.setAppointmentDate(rs.getString(7));
				ap.setEmail(rs.getString(8));
				ap.setPhoneNo(rs.getString(9));
				ap.setDiseases(rs.getString(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ap;
	}
	
	public boolean updateStatus(int id,int docid,String comment) {
		boolean f =false;
		
		try {
			
			String sql = "update appointment set status = ? where id =? and doc_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, docid);
			
			if(ps.executeUpdate()==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Appointment> getAllApoint(){
		List<Appointment> list = new ArrayList<>();
		Appointment ap= null;
		
		try {
			
			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				ap=new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setDoctoreid(rs.getInt(3));
				ap.setUserName(rs.getString(4));
				ap.setGender(rs.getString(5));
				ap.setAge(rs.getString(6));
				ap.setAppointmentDate(rs.getString(7));
				ap.setEmail(rs.getString(8));
				ap.setPhoneNo(rs.getString(9));
				ap.setDiseases(rs.getString(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				list.add(ap);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

}
