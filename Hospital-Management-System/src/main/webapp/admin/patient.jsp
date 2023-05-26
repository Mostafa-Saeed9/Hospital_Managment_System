<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.appointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="../componentStyle/allCSS.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<!--   علشان لو خرجت مينفش ادخل علي الصفحه من غير تسجيل دخول من جديد لو الصفحه مفتوحه من خلال رابط تاني -->

	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center text-success fw-bold">Patient Details</p>
				<c:if test="${not empty succMsg }">
					<p class="text-center text-danger fs-5">${succMsg}</p>
					<c:remove var="succMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errorMsg }">
					<p class="text-center text-danger fs-5">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>

						</tr>
					</thead>
					<tbody>
					<%
					appointmentDao dao =new appointmentDao(DBConnect.getConn());
					DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
					List<Appointment> list=  dao.getAllAppointment();
					for(Appointment ap:list){
					Doctor d = dao2.getDoctorById(ap.getDoctorId());
					%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td class="text-danger"><%=ap.getStatus()%></td>
							
							<td>
							</tr>
					<%}
					%>

						 
					</tbody>
				</table>

			</div>
		</div>
	</div>


</body>
</html>