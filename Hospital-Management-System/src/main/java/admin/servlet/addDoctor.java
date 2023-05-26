package admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class addDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fullName = req.getParameter("fullName");
		String birthDate = req.getParameter("birthDate");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String email = req.getParameter("email");
		String mobNo = req.getParameter("mobNo");
		String password = req.getParameter("password");

		Doctor d = new Doctor(fullName, birthDate, qualification, specialist, email, mobNo, password);
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		if (dao.registerDoctor(d)) {
			session.setAttribute("DSMsg", "Doctor added successfully");
			resp.sendRedirect("admin/view_doctor.jsp");
		} else {
			session.setAttribute("DEMsg", "invalid data");
			resp.sendRedirect("admin/doctor.jsp");
		}

	}
}