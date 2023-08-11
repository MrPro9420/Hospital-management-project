<%@page import="com.DAO.DoctoreDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/AllCSS.jsp"%>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@ include file="navbar.jsp"%>

	<c:if test="${empty adminOb}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid ">

		<div class="row">
			<div class="col-md-12 mt-3">
				<div class="card paint-card ">
					<div class="card-body ">
						<p class="text-center fs-3 fw-bold text-success mt-3">Patient
							Details</p>
							
							<table class="table">
							<thead>
					<tr>
					<th scope="col">Full Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Age</th>
					<th scope="col">Appointment Date</th>
					<th scope="col">Email</th>
					<th scope="col">Mobile No.</th>
					<th scope="col">Diseases</th>
					<th scope="col">Dr. Name</th>
					<th scope="col">Address</th>
					<th scope="col">Status</th>
					
					</tr>
					
					</thead>
					<tbody>
					<%
					
					AppointmentDAO dao = new AppointmentDAO(DbConnect.getCon());
					DoctoreDAO dao2 = new DoctoreDAO(DbConnect.getCon());
					List<Appointment> list = dao.getAllApoint();
					
					for(Appointment ap:list){%>
						<tr>
					<td><%=ap.getUserName()%></td>
					<td><%=ap.getGender()%></td>
					<td><%=ap.getAge()%></td>
					<td><%=ap.getAppointmentDate()%></td>
					<td><%=ap.getEmail()%></td>
					<td><%=ap.getPhoneNo()%></td>
					<td><%=ap.getDiseases()%></td>
					<td><%=dao2.getDoctore(ap.getDoctoreid()).getFullname()%></td>
					<td><%=ap.getAddress()%></td>
					<td><%=ap.getStatus()%></td>
					
					    </tr>
					<%} %>
					
					
					
					
					
					
					</tbody>
							
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>