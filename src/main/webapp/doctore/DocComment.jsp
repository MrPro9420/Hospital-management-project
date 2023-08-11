<%@page import="com.entity.Appointment"%>
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

.backimg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/slide-1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<body>

	<%@ include file="navbar.jsp"%>
	<c:if test="${empty doctoreObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backimg p-5"></div>

	<div class="container p-3">

		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card ">
					<div class="card-body ">
						<p class="text-center fs-3 fw-bold text-success mt-3">Patient
							Comment</p>
							
							<%
							int appontId = Integer.parseInt(request.getParameter("id"));
							AppointmentDAO dao = new AppointmentDAO(DbConnect.getCon());
						    Appointment ap	=dao.getAllApointByAppointmentId(appontId);
							
							
							%>
							
							<form action="../updatestatus" class="row" method="post">
							
							<div class="col-md-6">
							<label class="form-lable">Patient Name</label>
							<input type="text" readonly value="<%=ap.getUserName() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
							<label class="form-lable">Age</label>
							<input type="text" readonly value="<%=ap.getAge() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
							<label class="form-lable">Mobile No.</label>
							<input type="text" readonly value="<%=ap.getPhoneNo() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
							<label class="form-lable">Diseases</label>
							<input type="text"  value="<%=ap.getDiseases() %>" class="form-control">
							</div>
							
							<div class="col-md-12">
							<label class="form-lable">Comment</label>
							<textarea rows="3" cols="" required="required" name="comment" class="form-control"></textarea>
							</div>
							
							<input type="hidden" name="AppointmentId" value="<%=ap.getId()%>">
							<input type="hidden" name="DoctoreId" value="<%=ap.getDoctoreid() %>">
							
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3" type="submit">Submit</button>
							
							
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>