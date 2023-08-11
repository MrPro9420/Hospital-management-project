package com.admin.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.DoctoreDAO;
import com.Db.DbConnect;
import com.entity.Doctore;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/deleteDoc")
public class deleteDoc extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctoreDAO dao;
		try {
			dao = new DoctoreDAO(DbConnect.getCon());
			HttpSession session = req.getSession();
			
	        if(dao.deleteDoc(id)) {
	        	session.setAttribute("Succ","Doctore Deleted Successfully.");
				resp.sendRedirect("admin/DoctoreDetails.jsp");
	        }else {
	        	session.setAttribute("Err","Something went wrong. Try Again.");
				resp.sendRedirect("admin/DoctoreDetails.jsp");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
