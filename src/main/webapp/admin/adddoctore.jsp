<%@page import="com.DAO.DoctoreDAO"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctore"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.SpecialistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../components/AllCSS.jsp"%>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">



			<div class="col-md-4 offset-md-4">

				<div class="card paint-card">
					<div class="card-body">

						<h2 class="text-center text-success">Add Doctore</h2>

						<c:if test="${not empty Succ }">
							<p class="text-center fs-3 text-success fw-bolder">${Succ}</p>
							<c:remove var="Succ" />
						</c:if>
						<c:if test="${not empty Err }">
							<p class="text-center fs-3 text-danger fw-bolder">${Err}</p>
							<c:remove var="Err" />
						</c:if>



						<form action="../adddoctore" method="post">
							<div class="mb-3">

								<label class="form-lable">Full Name</label> <input type="text"
									name="fullname" class="form-control" required>

							</div>
							<div class="mb-3">

								<label class="form-lable">DOB</label> <input type="date"
									name="dob" class="form-control" required>

							</div>
							<div class="mb-3">

								<label class="form-lable">Qalification</label> <input
									type="text" name="qalification" class="form-control" required>

							</div>
							<div class="mb-3">

								<label class="form-lable">Specialist</label> <select name="spec"
									class="form-control" required>
									<option>--select--</option>
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
									name="email" class="form-control" required>

							</div>
							<div class="mb-3">

								<label class="form-lable">Mobile No.</label> <input type="text"
									name="mobno" class="form-control" required>

							</div>
							<div class="mb-3">

								<label class="form-lable">Password</label> <input
									type="password" name="password" class="form-control" required>

							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>

				</div>


			</div>

			

		</div>


	</div>


</body>
</html>