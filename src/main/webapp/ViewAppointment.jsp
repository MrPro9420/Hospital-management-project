<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctore"%>
<%@page import="com.DAO.DoctoreDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@include file="components/AllCSS.jsp"%>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backimg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/slide-1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<body>
	<%@include file="components/NavBar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backimg p-5"></div>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="paint-card p-3">
					<div class="card-body"></div>
					<p class="fs-4 fw-bold text-center text-success">My Appointment
						List</p>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Age</th>
								<th scope="col">Appointment Date</th>
								<th scope="col">Diseases</th>
								<th scope="col">Dr. Name</th>
								<th scope="col">Status</th>

							</tr>

						</thead>

						<tbody>

							<%
							User user = (User) session.getAttribute("userObj");

							AppointmentDAO dao = new AppointmentDAO(DbConnect.getCon());
							DoctoreDAO dao2 = new DoctoreDAO(DbConnect.getCon());
							List<Appointment> list = dao.getAllApointByUserId(user.getId());
							for (Appointment ap : list) {
								Doctore d = dao2.getDoctore(ap.getDoctoreid());
							%>

							<tr>
								<td><%=ap.getUserName()%></td>
								<td><%=ap.getGender()%></td>
								<td><%=ap.getAge()%></td>
								<td><%=ap.getAppointmentDate()%></td>
								<td><%=ap.getDiseases()%></td>
								<td><%=d.getFullname()%></td>
								<td>
									<%
									if ("Pending".equals(ap.getStatus())) {
									%> <a href="#"
									class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%>

									<%
									}
									%>
								</td>

							</tr>
							<%
							}
							%>







						</tbody>

					</table>

				</div>
			</div>

			<div class="col-md-3 p-3">

				<img alt="" src="img/Doctor-2.png" class="img-fluid">
			</div>


		</div>

	</div>

</body>
</html>