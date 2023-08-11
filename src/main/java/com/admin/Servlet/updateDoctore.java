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

@WebServlet("/updateDoc")
public class updateDoctore extends HttpServlet {

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
			String password = req.getParameter("password");

			Doctore doc = new Doctore(fullname, dob, qualification, spec, email, mobno, password);
			doc.setId(id);
			DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());

			HttpSession session = req.getSession();

			if (dao.updateDoctore(doc)) {
				session.setAttribute("Succ", "Doctore Updated Successfully.");
				resp.sendRedirect("admin/DoctoreDetails.jsp");
			} else {
				session.setAttribute("Err", "Something went wrong. Try Again.");
				resp.sendRedirect("admin/DoctoreDetails.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
