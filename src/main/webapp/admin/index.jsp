<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.DoctoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty adminOb}">
	<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	
	
	
	<div class="container p-5">
		<p class="text-center fs-3 text-success fw-bolder">Admin Dashboard</p>
				
				<c:if test="${not empty Succ }">
				<p class="text-center fs-3 text-success fw-bolder"> ${Succ}</p>
				<c:remove var="Succ"/>
				</c:if>
				<c:if test="${not empty Err }">
				<p class="text-center fs-3 text-danger fw-bolder"> ${Err}</p>
				<c:remove var="Err"/>
				</c:if>
				
				<%
				DoctoreDAO dao = new DoctoreDAO(DbConnect.getCon());
				
				%>


		<div class="row">
			<div class="col-md-4  mt-4">
				<div class="card paint-card " data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-stethoscope fs-1"></i>
						<p class="text-center fs-4">
							Specialist <br> <%=dao.countSpec() %>
						</p>

					</div>
				</div>
			</div>
			<div class="col-md-4  mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-doctor fs-1"></i>
						<p class="text-center fs-4">
							Doctor <br> <%=dao.countDoc()%>
						</p>

					</div>
				</div>
			</div>
			<div class="col-md-4  mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-circle-user fs-1"></i>
						<p class="text-center fs-4">
							User <br> <%=dao.countUser() %>
						</p>

					</div>
				</div>
			</div>
			<div class="col-md-4  mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-calendar-check fs-1"></i>
						<p class="text-center fs-4">
							Total Appointment <br> <%=dao.countAppoint() %>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>




<!-- Specialist Model -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="../addspec" method="post">
       <div class="form-group">
       <label class="form-lable">Enter Specialist Name :</label>
       <input class="mt-1" type="text" name="specName" class="form-control">
       </div>
       <div class="text-center mt-3">
       <button class="btn btn-success" type="submit">Add</button>
       </div>
       
       
       
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>





</body>
</html>