package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctore;

public class DoctoreDAO {

	private Connection con;

	public DoctoreDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean regDoctore(Doctore d) {
		boolean f = false;

		try {

			String sql = "insert into doctore(fullname, dob, qualification, specialist, email, mobno, password)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist_type());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Doctore> getAllDoctore() {

		List<Doctore> list = new ArrayList<Doctore>();
		Doctore d=null;
		try {
			
			String sql = "select * from doctore order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d=new Doctore();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist_type(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public Doctore getDoctore(int id) {
		
		
		Doctore d=null;
		try {
			
			String sql = "select * from doctore where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d=new Doctore();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist_type(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return d;
	}
	
	public boolean  updateDoctore(Doctore d) {
		boolean f = false;

		try {

			String sql = "update doctore set fullname=?, dob=?, qualification=?, specialist=?, email=?, mobno=?, password=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist_type());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean deleteDoc(int id) {
		boolean f=false;
		
		try {
			
			String sql = "delete from doctore where id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			if(1==ps.executeUpdate()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public Doctore login(String Email,String Password) {
		Doctore d= null;
		
		try {
			
			String sql ="select * from doctore where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Email);
			ps.setString(2, Password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d=new Doctore();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist_type(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return d;
	}
	
	public int countDoc() {
		int i=0;
		
		try {
			
			String sql ="select * from doctore";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppoint() {
		int i=0;
		
		try {
			
			String sql ="select * from appointment";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	public int countUser() {
		int i=0;
		
		try {
			
			String sql ="select * from user";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countSpec() {
		int i=0;
		
		try {
			
			String sql ="select * from specialist";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppointByDocId(int docId) {
		int i=0;
		
		try {
			
			String sql ="select * from appointment where doc_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, docId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public boolean changePass(int id,String OldPass,String NewPass) {
		boolean f = false;
		
		try {
			String sql = "update doctore set password = ? where id=? and password=?";
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
	
	
	public boolean  editDoctore(Doctore d) {
		boolean f = false;

		try {

			String sql = "update doctore set fullname=?, dob=?, qualification=?, specialist=?, email=?, mobno=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist_type());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setInt(7, d.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
