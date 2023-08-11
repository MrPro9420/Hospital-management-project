<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand fw-bold fs-4" href="Index.jsp"><i
			class="fa-solid fa-hospital me-3 fs-1"></i>  MEDIHOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">HOME</a></li>
				
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="Patiant.jsp">PATIENTS</a></li>
			</ul>

			<form class="d-flex">
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">Dr. ${doctoreObj.fullname}</button>
					<ul class="dropdown-menu bg-light">
						<li class=""><a class="dropdown-item text-success" href="EditProfile.jsp">Edit Profile <i class="fa-solid fa-clipboard-user fs-5"></i></a></li>
						<li class=""><a class="dropdown-item text-success" href="../doctorelogout">Logout  <i class="fa-solid fa-right-from-bracket"></i></a></li>
						
					</ul>
				</div>

			</form>


		</div>
	</div>
</nav>