<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.AppointmentDAO"%>
<%@page import="com.entity.Doctore"%>
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
	<c:if test="${empty doctoreObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-3">

		<div class="row">
			<div class="col-md-12 ">
				<div class="card paint-card ">
					<div class="card-body ">
					<p class="text-center fs-3 fw-bold text-success mt-3">Patient Details</p>
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
					<th scope="col">Status</th>
					<th scope="col">Action</th>
					
					</tr>
					
					</thead>
					<tbody>
					<%
					Doctore doc = (Doctore) session.getAttribute("doctoreObj");
					AppointmentDAO dao = new AppointmentDAO(DbConnect.getCon());
					List<Appointment> list = dao.getAllApointByDoctoreId(doc.getId());
					for(Appointment ap:list){%>
					
						
					<tr>
					<td><%=ap.getUserName()%></td>
					<td><%=ap.getGender()%></td>
					<td><%=ap.getAge()%></td>
					<td><%=ap.getAppointmentDate()%></td>
					<td><%=ap.getEmail()%></td>
					<td><%=ap.getPhoneNo()%></td>
					<td><%=ap.getDiseases()%></td>
					<td><%=ap.getStatus()%></td>
					<td>
					<%if("Pending".equals(ap.getStatus())){%>
						
						<a href="DocComment.jsp?id=<%=ap.getId()%>"
								class="btn btn-sm btn-success"><i
									class="fa-solid fa-comment-medical"></i> Comment</a>
					<%}else{ %>
					
					<a  href="DocComment.jsp?id=<%=ap.getId()%>"
								class="btn btn-sm btn-success disabled"><i
									class="fa-solid fa-comment-medical " ></i> Commented</a>
					
					
					<%} %>
					
					
				
					
				
									</td>
					
					</tr>
					
					
					<% }%>
					
					
				
					</tbody>
					
					</table>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>