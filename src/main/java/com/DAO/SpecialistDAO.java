package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDAO {
	
	private Connection con;

	public SpecialistDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addSps(String sps) {
		boolean f = false;
		
		try {
			
			String sql = "insert into specialist(sps_type) values(?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, sps);
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}
	
	public List<Specialist> getallSpec(){
		
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;
		     try {
				
		    	 String sql = "select * from specialist";
		    	 PreparedStatement ps = con.prepareStatement(sql);
		    	 ResultSet rs = ps.executeQuery();

		    	 while (rs.next()) {
					s=new Specialist();
					s.setSps_Id(rs.getInt(1));
					s.setSps_Name(rs.getString(2));
					list.add(s);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}

}