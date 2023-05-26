<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital System</title>
<%@include file="componentStyle/allCSS.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.navbar .nav-item:hover .nav-link {
	background: white;
	color: black;
	border-radius: 10px;
}
</style>

</head>
<body>

	<%@ include file="componentStyle/Home-navbar.jsp"%>


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
				<img src="img/d1.jpg" class="d-block w-100" alt="..." height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/d4.jpg" class="d-block w-100" alt="..." height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/d2.jpg" class="d-block w-100" alt="..." height="500px">
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


	<div class="container mt-5  ">
		<p class="text-center fs-2 ">Key Features of our Hospital</p>

		<div class="row ">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>We have sterile and clean equipment and a whole team
									responsible for the cleanliness of the building</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>hospital's location is far away crowded environment and traffic so
									there is no infection</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/doctor.png" height="350px" class="w-100 pt-5">
			</div>

		</div>
	</div>

	<hr>

	<div class="container mt-5">
		<p class="text-center  fs-1 ">Our Team</p>

		<div class="row mt-5">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/d3.jpg" width="230px" height="250px">
						<p class="fw-bold fs-5">Mostafa Saeed</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/d8.jpg" width="230px" height="250px">
						<p class="fw-bold fs-5">Dr.Mohamed Saeed</p>
						<p class="fs-7">(public surgion)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/d7.jpg" width="230px" height="250px">
						<p class="fw-bold fs-5">Dr.Ahmed Saeed</p>
						<p class="fs-7">(childerns spcialist)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/d6.jpg" width="230px" height="250px">
						<p class="fw-bold fs-5">Dr. Khalid Ramadan</p>
						<p class="fs-7">(dentist spcialist)</p>
					</div>
				</div>
			</div>

		</div>

	</div>

	<div class="container-fluid p-1 bg-success text-center text-white">
		<p>@copyright hospital.com</p>
	</div>



</body>
</html>