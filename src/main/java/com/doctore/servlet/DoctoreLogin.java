package com.doctore.servlet;

import java.io.IOException;

import com.DAO.DoctoreDAO;
import com.DAO.userDAO;
import com.Db.DbConnect;
import com.entity.Doctore;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doclogin")
public class DoctoreLogin extends HttpServlet {

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

			DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());
			Doctore currentDoc = dao.login(Email, Password);

			if (currentDoc != null) {

				session.setAttribute("doctoreObj", currentDoc);
				resp.sendRedirect("doctore/index.jsp");
			} else {

				session.setAttribute("errMsg", "Invalid Email And Passowrd");
				resp.sendRedirect("doctor_login.jsp");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
