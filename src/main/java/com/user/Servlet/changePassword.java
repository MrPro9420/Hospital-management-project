package com.user.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.userDAO;
import com.Db.DbConnect;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePass")
public class changePassword extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String OldPass=req.getParameter("oldpass");
		String NewPass=req.getParameter("newpass");
		
		try {
			userDAO dao = new userDAO(DbConnect.getCon());
			
			HttpSession session = req.getSession();
			
			if(dao.changePass(uid, OldPass, NewPass)) {
				session.setAttribute("PassSucc",	"Password Changed Successfully.Login Again.");
				resp.sendRedirect("user_login.jsp");
				session.removeAttribute("userObj");
			}else {
				session.setAttribute("PassErr",	" Wrong Old Password.Please Try Again");
				resp.sendRedirect("changePassword.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	
	
}
