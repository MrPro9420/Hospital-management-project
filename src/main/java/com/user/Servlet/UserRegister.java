package com.user.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.userDAO;
import com.Db.DbConnect;
import com.entity.User;

/**
 * Servlet implementation class UserRegister
 */

@WebServlet("/register")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String fullname = req.getParameter("fullname");
			String Email = req.getParameter("email");
			String Password = req.getParameter("password");
			
			User u = new User(fullname, Email, Password);
			
			userDAO dao = new userDAO(DbConnect.getCon());
			
			HttpSession session = req.getSession();
			
			boolean f = dao.register(u);

             if (f) {
            	 session.setAttribute("successMsg","Registeration Successfull.");
            	 res.sendRedirect("SignUp.jsp");
            	 System.out.println("Register Successfull");
				
			} else {
				session.setAttribute("failMsg","Registeration Failed.");
           	 res.sendRedirect("SignUp.jsp");
				System.out.println("Something Wrong");

			}			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
