<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.google.protobuf.Option"%>
<%@page import="com.entity.Specialiest"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.specialiestDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<title>Insert title here</title>
<%@ include file="../componentStyle/allCSS.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold text-success">Add Doctor</p>

						

						<c:if test="${not empty DEMsg }">
							<p class="text-center text-danger fs-5">${DEMsg}</p>
							<c:remove var="DEMsg" scope="session" />
						</c:if>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">birthDate</label> <input type="date"
									required name="birthDate" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option>.. select ..</option>
									<%
									specialiestDao dao = new specialiestDao(DBConnect.getConn());
									List<Specialiest> list = dao.getAllSpecialiests();

									for (Specialiest s : list) {
									%>
									<option><%=s.getSpecialiestName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Nomber</label> <input
									type="text" required name="mobNo" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>