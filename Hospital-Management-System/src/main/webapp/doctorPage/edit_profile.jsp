<%@page import="com.entity.Specialiest"%>
<%@page import="com.dao.specialiestDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>

<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../componentStyle/allCSS.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../doctorPage/navbar.jsp"%>
	
<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3 text-success fw-bold">Change Password</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3 text-danger">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5 text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../changeDoctorPass" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${docObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3 text-success fw-bold">Edit Profile</p>
					<c:if test="${not empty DSMsg }">
						<p class="text-center text-success fs-3 text-danger">${DSMsg}</p>
						<c:remove var="DSMsg" scope="session" />
					</c:if>

					<c:if test="${not empty DEMsg }">
						<p class="text-center text-danger fs-5 text-danger">${DEMsg}</p>
						<c:remove var="DEMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../updateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control"
									value="${docObj.fullName }">
							</div>

							<div class="mb-3">
								<label class="form-label">birthDate</label> <input type="date"
									required name="birthDate" class="form-control"
									value="${docObj.birthDate }">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control"
									value="${docObj.qualification }">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="specialist"
									required class="form-control">
									<option>${docObj.specialist }</option>

									<%
									specialiestDao dao = new specialiestDao(DBConnect.getConn());
									List<Specialiest> list = dao.getAllSpecialiests();
									for (Specialiest s : list) 
									{
									%>
									<option><%=s.getSpecialiestName() %></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${docObj.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobNo" class="form-control"
									value="${docObj.mobNo }">
							</div>

							<input type="hidden" name="id" value="${docObj.id }">

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>


		</div>
	</div>

	
</body>
</html>