package Doctor.servlet;

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

@WebServlet("/updateProfile")
public class updateDoctorProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullName");
			String birthDate = req.getParameter("birthDate");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String mobNo = req.getParameter("mobNo");
			int id = Integer.parseInt(req.getParameter("id"));

			Doctor d = new Doctor(id, fullName, birthDate, qualification, specialist, email, mobNo, "");
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			if (dao.editDoctorProfile(d)) {
				session.setAttribute("DSMsg", "Doctor updated successfully");
				resp.sendRedirect("doctorPage/edit_profile.jsp");
			} else {
				session.setAttribute("DEMsg", "invalid data");
				resp.sendRedirect("doctorPage/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
