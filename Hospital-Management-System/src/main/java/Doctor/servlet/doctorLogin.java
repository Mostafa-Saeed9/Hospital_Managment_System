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

@WebServlet("/doctorLogin")
public class doctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String email = req.getParameter("email");
			String pass = req.getParameter("password");

			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			Doctor d = dao.login(email, pass);
			HttpSession session = req.getSession();

			if (d != null) {
				session.setAttribute("docObj", d);
				session.setAttribute("sucMsg", "data inserted successfully");
				resp.sendRedirect("doctorPage/index.jsp");
			} else {
				session.setAttribute("errorMsg", "invalid email & password");
				resp.sendRedirect("doctor_login.jsp");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}

}
