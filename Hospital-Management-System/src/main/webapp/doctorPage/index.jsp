<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashbord</title>
<%@include file="../componentStyle/allCSS.jsp"%>

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
	<%@ include file="../doctorPage/navbar.jsp"%>
	<!--   علشان لو خرجت مينفش ادخل علي الصفحه من غير تسجيل دخول من جديد لو الصفحه مفتوحه من خلال رابط تاني -->

	<c:if test="${empty docObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Doctor Dashboard</p>
		<%
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		Doctor d = (Doctor) session.getAttribute("docObj");
		%>
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointmentByDocotrId(d.getId())%>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>