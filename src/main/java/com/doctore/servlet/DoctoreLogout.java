package com.doctore.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/doctorelogout")
public class DoctoreLogout extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		HttpSession session = req.getSession();
		session.removeAttribute("doctoreObj");
		session.setAttribute("succeMsg","Logout Successfully");
		resp.sendRedirect("doctor_login.jsp");
	}

}
