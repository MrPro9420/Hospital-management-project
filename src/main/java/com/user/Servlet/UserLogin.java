package com.user.Servlet;

import java.io.IOException;

import com.DAO.userDAO;
import com.Db.DbConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String Email = req.getParameter("email");
			String Password = req.getParameter("password");

			HttpSession session = req.getSession();
			
			userDAO dao = new userDAO(DbConnect.getCon());
			User currentUser = dao.login(Email, Password);

			if (currentUser!=null) {

				session.setAttribute("userObj", currentUser);
				resp.sendRedirect("Index.jsp");
			}
			else {

				session.setAttribute("errMsg", "Invalid Email And Passowrd");
				resp.sendRedirect("user_login.jsp");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
