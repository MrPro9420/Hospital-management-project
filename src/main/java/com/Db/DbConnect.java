package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DbConnect {
	
	private static Connection con ;
	
	public static Connection getCon() throws SQLException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","Prabhat@123");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return con;
	}

}
