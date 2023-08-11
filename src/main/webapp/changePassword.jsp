<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/AllCSS.jsp"%>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@include file="components/NavBar.jsp"%>
	
	<c:if test="${empty userObj }"> 
	<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="paint-card">
					


					<div class="card-body">
					
					<c:if test="${not empty PassErr}">

						<p class="text-center text-danger fs-5 mt-2">${PassErr}</p>
						<c:remove var="PassErr" scope="session" />


					</c:if>

					<c:if test="${not empty PassSucc}">

						<p class="text-center text-success fs-5 mt-2">${PassSucc}</p>
						<c:remove var="PassSucc" scope="session" />


					</c:if>
						<p class="fs-5 text-center text-success fw-bold">Change
							Password</p>

						<form action="changePass" method="post">

							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									required name="newpass" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									required name="oldpass" type="text" class="form-control">
							</div>
							<input type="hidden" name="uid" value="${userObj. getId()}">
							<button class="btn btn-success col-md-12" type="submit">Change
								Password</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>