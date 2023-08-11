<%@page import="com.entity.Doctore"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.DoctoreDAO"%>
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

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>

	<%@ include file="navbar.jsp"%>
	<c:if test="${empty doctoreObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<p class="text-center fs-3 fw-bold text-success mt-3">Doctor
		Dashboard</p>

	<div class="container p-5">
		<%
		Doctore doc = (Doctore) session.getAttribute("doctoreObj");
		DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());
		%>


		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card ">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-nurse fs-2"></i>
						<p class="text-center fs-4">
							Doctors<br> <%=dao.countDoc()%>
						</p>

					</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card paint-card ">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar-check fs-2"></i>
						<p class="text-center fs-4">
							Appointments<br> <%=dao.countAppointByDocId(doc.getId()) %>
						</p>

					</div>
				</div>
			</div>

		</div>

	</div>


</body>
</html>