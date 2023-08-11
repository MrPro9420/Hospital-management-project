package com.admin.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.SpecialistDAO;
import com.Db.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addspec")
public class AddSpecialist extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String Sps_name = req.getParameter("specName");
	
		try {
			SpecialistDAO Dao =  new SpecialistDAO(DbConnect.getCon());
			boolean f = Dao.addSps(Sps_name);
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("Succ","Specialist Added Successfully.");
				resp.sendRedirect("admin/index.jsp");
			}else {
				session.setAttribute("Err","Something went wrong. Try Again.");
				resp.sendRedirect("admin/index.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
}
