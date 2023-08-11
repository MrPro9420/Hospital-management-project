<%@page import="com.Db.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="components/AllCSS.jsp"%>

</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	border-radius: 10px
}

@import
	url('https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap');
</style>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>



	<!-- NavBAr -->
	<%@include file="components/NavBar.jsp"%>


	<!-- carosal-->

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/slide-1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/slide-2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/slide-3.png" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- First Section... -->
	<div class="container-fluid p-2  ">
		<p class="text-center"
			style="font-size: 50px;font-weight: 600; background-image: radial-gradient(#96deda, #50c9c3); color: transparent; background-clip: text; -webkit-background-clip:text;">Key
			features of our Hospital</p>

		<div class="row " >
			<div class="col-md-10 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4 fw-bold text-warning text-uppercase">A
									Culture of Excellence</p>
								<p class="text-break">Hospitals are complex machineries run
									by human minds and hands. And is natural for human errors to
									creep in sometimes. Foster this culture of excellence in your
									hospital and inspire your team to put their best foot forward
									at all times.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4 fw-bold text-warning text-uppercase">Efficient
									and Empathetic Staff</p>
								<p>The nursing staff are typically the largest group of
									caregivers in a hospital. Consultants or junior doctors meet a
									patient maybe twice or thrice a day but the regular banter
									between a patient and a nurse is what makes all the difference
									to her experience in a hospital.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-4">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4 fw-bold text-warning text-uppercase">Timely
									Communication</p>
								<p>This is the key to the success of any relationship
									including the one between a patient and a hospital. Delay in
									medication arrival to delay in sample collection to minor human
									errors, everything can be handled with timely and effective
									communication.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-4">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-4 fw-bold text-warning text-uppercase">Transparent
									Pricing</p>
								<p class="text-wrap">A very common practice among patient
									attendants in India, is requesting a discount on the final
									bill. This is one of the main reasons why people go looking for
									a connection within the management or the hospital.Many
									Hospitals have achieved this, yours can too.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 mt-5 ">
				<img alt="" src="img/Doctor-2.png" height="400px"
					class="mt-5 img-fluid">
			</div>
		</div>
	</div>

	<hr>

	<div class="container p-2 mb-3">
		<p class="text-center fs-2 text-success fw-bold">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doctor.png" width="250px" height="270px">
						<p class="fw-bold fs-5">Dr. Samauni Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doctor-3.png" width="250px" height="270px">
						<p class="fw-bold fs-5">Dr. George A. Beller</p>
						<p class="fs-7">(Cardiology Specialist)</p>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doctor-4.png" width="250px" height="270px">
						<p class="fw-bold fs-5">Dr. W. Kline Bolton</p>
						<p class="fs-7">(Nephrology Specialist)</p>

					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/doctor-5.png" width="250px" height="270px">
						<p class="fw-bold fs-5">Dr. Bradley M. Rodgers</p>
						<p class="fs-7">( Pediatric surgery Specialist)</p>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="components/footer.jsp"%>



</body>
</html>