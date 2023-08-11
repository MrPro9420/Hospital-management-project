package com.doctore.servlet;

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
@WebServlet("/editdocprofile")
public class EditDocProfile extends HttpServlet {

	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id")); 
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qalification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			

			Doctore doc = new Doctore(fullname, dob, qualification, spec, email, mobno,"");
			doc.setId(id);
			DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());

			HttpSession session = req.getSession();

			if (dao.editDoctore(doc)) {
				session.setAttribute("EditSucc", "Details Updated Successfully.Login Again.");
				resp.sendRedirect("doctor_login.jsp");
				session.removeAttribute("doctoreObj");
			} else {
				session.setAttribute("EditErr", "Something went wrong. Try Again.");
				resp.sendRedirect("doctore/EditProfile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
