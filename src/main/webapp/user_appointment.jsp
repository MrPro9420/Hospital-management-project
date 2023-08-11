<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.DoctoreDAO"%>
<%@page import="com.entity.Doctore"%>

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

	<div class="container-fluid backimg p-5"></div>

	<div class="container p-3">
		<div class="row">





			<div class="col-md-4 p-5 text-center">
				<img alt="" src="img/Doctor-2.png">

			</div>

			<div class="col-md-8">

				<div class="paint-card p-3">
					<div class="card-body">
						<p class="fs-5 text-center">User Appointment</p>

						<c:if test="${not empty AppSucc }">

							<p class="text-center text-success fs-5">${AppSucc}</p>
							<c:remove var="AppSucc" scope="session" />


						</c:if>
						<c:if test="${not empty AppErr }">

							<p class="text-center text-danger fs-5">${AppErr}</p>
							<c:remove var="AppErr" scope="session" />


						</c:if>


						<form class="row g-3" action="appointmentServ" method="post">

							<input type="hidden" name="userid" value="${userObj.getId()}">

							<div class="col-md-6">
								<label for="inputName" class="form-lable">Full Name</label> <input
									type="text" class="form-control" name="fullname" required
									value="${userObj.getFullname()}">

							</div>
							<div class="col-md-6">
								<label for="inputGender" class="form-lable">Gender</label> <select
									class="form-control" name="gender" required>
									<option>--select--</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
									<option value="other">Other</option>

								</select>

							</div>
							<div class="col-md-6">
								<label for="inputAge" class="form-lable">Age</label> <input
									type="text" class="form-control" name="age" required>

							</div>
							<div class="col-md-6">
								<label for="inputdate" class="form-lable">Appointment
									Date</label> <input type="date" class="form-control"
									name="appoint_date" required>

							</div>
							<div class="col-md-6">
								<label for="inputphoneno" class="form-lable">Phone No.</label> <input
									type="text" class="form-control" name="phoneNO" required>

							</div>
							<div class="col-md-6">
								<label for="inputdisease" class="form-lable">Diseases</label> <input
									type="text" class="form-control" name="diseases" required>

							</div>

							<div class="col-md-6">
								<label for="inputEmail" class="form-lable">Email</label> <input
									type="text" class="form-control" name="email" required
									value="${userObj.getEmail() }">

							</div>

							<div class="col-md-6">
								<label for="inputdoc" class="form-lable">Doctore</label> <select
									class="form-control" name="doctoreid" required>
									<option>--select--</option>

									<%
									DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());
									List<Doctore> list = dao.getAllDoctore();
									for (Doctore d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullname()%>(<%=d.getSpecialist_type()%>)
									</option>




									<%
									}
									%>



								</select>

							</div>

							<div class="col-md-12">
								<label for="inputadd" class="form-lable">Address</label>
								<textarea rows="3" cols="" class="form-control" name="address"
									required="required"></textarea>

							</div>


							<c:if test="${empty userObj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-success"
									type="submit">Submit</button>
							</c:if>





						</form>



					</div>
				</div>
			</div>

		</div>

	</div>


	<div class="container-fluid backimg p-5"></div>

</body>
</html>