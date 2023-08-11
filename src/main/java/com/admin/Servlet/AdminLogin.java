package com.admin.Servlet;

import java.io.IOException;

import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			String Email = req.getParameter("email");
			String Password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			
			if("ADMIN@gmail.com".equals(Email)&&"ROOT".equals(Password)) {
				
				session.setAttribute("adminOb", new User());
				resp.sendRedirect("admin/index.jsp");
			}
			else {
				
				session.setAttribute("errorMsg", "Invalid Email And Passowrd");
				resp.sendRedirect("admin_login.jsp");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	

}
