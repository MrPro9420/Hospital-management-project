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





			<div class="col-md-12">
				<div class="card paint-card">

					<div class="card-body">

						<c:if test="${not empty Succ }">
							<p class="text-center fs-3 text-success fw-bolder">${Succ}</p>
							<c:remove var="Succ" />
						</c:if>
						<c:if test="${not empty Err }">
							<p class="text-center fs-3 text-danger fw-bolder">${Err}</p>
							<c:remove var="Err" />
						</c:if>


						<h3 class="text-center">Doctore details</h3>

						<table class="table">

							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No.</th>
									<th scope="col">Action</th>


								</tr>


							</thead>

							<tbody>
								<%
								DoctoreDAO dao2 = new DoctoreDAO(DbConnect.getCon());

								List<Doctore> list2 = dao2.getAllDoctore();
								for (Doctore d : list2) {
								%>



								<tr>
									<td scope="col"><%=d.getFullname()%></td>
									<td scope="col"><%=d.getDob()%></td>
									<td scope="col"><%=d.getQualification()%></td>
									<td scope="col"><%=d.getSpecialist_type()%></td>
									<td scope="col"><%=d.getEmail()%></td>
									<td scope="col"><%=d.getMobno()%></td>
									<td scope="col"><a class="btn btn-sm btn-primary"
										href="edit_DoctoreDetails.jsp?id=<%=d.getId()%>">Edit</a> <a
										class="btn btn-sm btn-danger ms-3" data-bs-toggle="modal"
										data-bs-target="#exampleModa2"
										<%-- href="deleteDoc?id=<%=d.getId()%>" --%>>Delete</a></td>

								</tr>

								<!-- Modal -->
								<div class="modal fade" id="exampleModa2" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Confirmation
													Dialog</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body text-center">
											<p>Want to Delete this record?</p>

												<a class="btn btn-md btn-danger me-3" 
													href="../deleteDoc?id=<%=d.getId()%>">Yes</a>
												<a class="btn btn-md btn-success ms-3"
													data-bs-dismiss="modal">No</a>
												
											</div>

										</div>
									</div>
								</div>


								<%
								}
								%>

							</tbody>

						</table>

					</div>

				</div>


			</div>



		</div>


	</div>


</body>
</html>