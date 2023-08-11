package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userDAO {
	
	private Connection con;

	public userDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean register(User u) {
		boolean f = false;
		
		try {
			
			String sql = "insert into user(fullname,email,password)values(?,?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,u.getFullname());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPassword());
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
;		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}
	
	public User login(String Email,String Pass) {
		User u = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Email);
			ps.setString(2, Pass);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return u;
	}
	
	public boolean changePass(int id,String OldPass,String NewPass) {
		boolean f = false;
		
		try {
			String sql = "update user set password = ? where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, NewPass);
			ps.setInt(2, id);
			ps.setString(3, OldPass);
			
			if(ps.executeUpdate()==1) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}

}
