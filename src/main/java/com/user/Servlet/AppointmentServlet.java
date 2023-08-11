package com.user.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.DAO.AppointmentDAO;
import com.Db.DbConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/appointmentServ")
public class AppointmentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		 int userid = Integer.parseInt(req.getParameter("userid"));
		 int doctoreid = Integer.parseInt(req.getParameter("doctoreid"));
		 String userName = req.getParameter("fullname");
		 String gender = req.getParameter("gender");
		 String age = req.getParameter("age");
		 String appointmentDate = req.getParameter("appoint_date");
		 String email = req.getParameter("email");
		 String phoneNo = req.getParameter("phoneNO");
		 String diseases = req.getParameter("diseases") ;
		 String address = req.getParameter("address");
	
		Appointment ap = new Appointment(userid, doctoreid, userName, gender, age, appointmentDate, email, phoneNo, diseases, address, "Pending");
		
		try {
			AppointmentDAO dao = new AppointmentDAO(DbConnect.getCon());
			
			HttpSession session = req.getSession();
			
			
			if(dao.addApointment(ap)) {
				session.setAttribute("AppSucc", "Appointment Successfully Done.");
				resp.sendRedirect("user_appointment.jsp");
			}else {
				session.setAttribute("AppErr", "Something went wrong.Please Try Again");
				resp.sendRedirect("user_appointment.jsp");
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
