
<%@page import="com.DAO.DoctoreDAO"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctore"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.SpecialistDAO"%>
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

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 ">
				<div class="paint-card">



					<div class="card-body">

						<c:if test="${not empty PassErr}">

							<p class="text-center text-danger fs-5 mt-2">${PassErr}</p>
							<c:remove var="PassErr" scope="session" />


						</c:if>

						
						<p class="fs-5 text-center text-success fw-bold">Change
							Password</p>

						<form action="../docchangepass" method="post">

							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									required name="newpass" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									required name="oldpass" type="text" class="form-control">
							</div>
							<input type="hidden" name="uid" value="${doctoreObj.getId()}">
							<button class="btn btn-success col-md-12" type="submit">Change
								Password</button>

						</form>
					</div>
				</div>
			</div>

			<div class="col-md-8 ">
				<div class="paint-card">



					<div class="card-body">
					
					<p class="fs-3 text-center text-success fw-bold">Edit Profile</p>
					<c:if test="${not empty EditErr}">

							<p class="text-center text-danger fs-5 mt-2">${EditErr}</p>
							<c:remove var="EditErr" scope="session" />


						</c:if>

						
					
					<form action="../editdocprofile" method="post">
							<div class="mb-3">

								<label class="form-lable">Full Name</label> <input type="text"
									name="fullname" class="form-control" required value="${doctoreObj.getFullname()}" >

							</div>
							<div class="mb-3">

								<label class="form-lable">DOB</label> <input type="date"
									name="dob" class="form-control" required value="${doctoreObj.getDob()}">

							</div>
							<div class="mb-3">

								<label class="form-lable">Qalification</label> <input
									type="text" name="qalification" class="form-control" required value="${doctoreObj.getQualification()}">

							</div>
							<div class="mb-3">

								<label class="form-lable">Specialist</label> <select name="spec"
									class="form-control" required >
									<option>${doctoreObj.getSpecialist_type()}</option>
									<%
									SpecialistDAO dao = new SpecialistDAO(DbConnect.getCon());
									List<Specialist> list = dao.getallSpec();

									for (Specialist s : list) {
									%>

									<option><%=s.getSps_Name()%></option>

									<%
									}
									%>
								</select>

							</div>
							<div class="mb-3">

								<label class="form-lable">Email</label> <input type="email"
									name="email" class="form-control" readonly value="${doctoreObj.getEmail()}">

							</div>
							<div class="mb-3">

								<label class="form-lable">Mobile No.</label> <input type="text"
									name="mobno" class="form-control" required value="${doctoreObj.getMobno()}">

							</div>
							
							<input type="hidden" name="id" value="${doctoreObj.getId()}">
							

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					
					
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>