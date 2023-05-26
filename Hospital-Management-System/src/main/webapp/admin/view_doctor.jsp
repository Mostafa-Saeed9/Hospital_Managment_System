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


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold text-success">Doctor
							Details</p>

						<c:if test="${not empty DSMsg }">
							<p class="text-center text-danger fs-5">${DSMsg}</p>
							<c:remove var="DSMsg" scope="session" />
						</c:if>

						<c:if test="${not empty DEMsg }">
							<p class="text-center text-danger fs-5">${DEMsg}</p>
							<c:remove var="DEMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Birth Date</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialiest</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								DoctorDao dao = new DoctorDao(DBConnect.getConn());
								List<Doctor> list = dao.getAllDoctor();
								for (Doctor d : list) {
								%>

								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getBirthDate()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td>
									<a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> 
										
										<a href="../deleteDoctor?id=<%=d.getId() %>"
										class="btn btn-sm btn-danger">Delete</a>
										</td>
								</tr>
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