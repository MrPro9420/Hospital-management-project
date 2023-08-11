package com.admin.Servlet;

import java.io.IOException;

import com.DAO.DoctoreDAO;
import com.Db.DbConnect;
import com.entity.Doctore;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adddoctore")
public class AddDoctore extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qalification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");
			
			Doctore doc = new Doctore(fullname, dob, qualification, spec, email, mobno, password);
			DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());
			
			HttpSession session = req.getSession();
		
            if(dao.regDoctore(doc)) {
            	session.setAttribute("Succ","Doctore Added Successfully.");
				resp.sendRedirect("admin/DoctoreDetails.jsp");
            }else {
            	session.setAttribute("Err","Something went wrong. Try Again.");
				resp.sendRedirect("admin/DoctoreDetails.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();		}
		
		
	}
	
	

}
