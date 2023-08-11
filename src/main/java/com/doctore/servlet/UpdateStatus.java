package com.doctore.servlet;

import java.io.IOException;

import com.DAO.AppointmentDAO;
import com.Db.DbConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updatestatus")
public class UpdateStatus extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int appointId = Integer.parseInt(req.getParameter("AppointmentId"));
			int docId = Integer.parseInt(req.getParameter("DoctoreId"));
			String Status = req.getParameter("comment");
			
			HttpSession session = req.getSession();
			AppointmentDAO dao = new AppointmentDAO(DbConnect.getCon());
			
			if(dao.updateStatus(appointId, docId, Status)) {
				session.setAttribute("commsucc", "Comment Updated.");
				resp.sendRedirect("doctore/Patiant.jsp");
			}else {
				session.setAttribute("commerr", "Comment not Updated.Error Occured.");
				resp.sendRedirect("doctore/Patiant.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
