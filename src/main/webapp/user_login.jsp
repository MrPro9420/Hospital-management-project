<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <%@page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@include file="components/AllCSS.jsp" %>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<body>
<%@include file="components/NavBar.jsp" %>

<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="paint-card">
					<div class="card-body">
						<p class="fs-5 text-center">User Login</p>
						<c:if test="${not empty errMsg}">
						
							<p class="text-center text-danger fs-5">
								${errMsg}
							</p>
							<c:remove var="errMsg" scope="session"/>
						
						
						</c:if> 
						<c:if test="${not empty PassSucc}">

						<p class="text-center text-success fs-5 mt-2">${PassSucc}</p>
						<c:remove var="PassSucc" scope="session" />


					</c:if>
						
						<c:if test="${not empty succeMsg}">
						
							<p class="text-center text-success fs-5">
								${succeMsg}
							</p>
							<c:remove var="succeMsg" scope="session"/>
						
						
						</c:if> 
						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label>
								<input required name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input required name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
						</form>
						<br> Don't have an account? <a href="SignUp.jsp" class="text-decoration-none">Create one</a>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>