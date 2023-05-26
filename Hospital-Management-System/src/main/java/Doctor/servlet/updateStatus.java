package Doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.appointmentDao;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class updateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int docId = Integer.parseInt(req.getParameter("did"));
			String comment = req.getParameter("comm");
			HttpSession session = req.getSession();
			appointmentDao dao = new appointmentDao(DBConnect.getConn());
			if (dao.updateCommentStatus(id, docId, comment)) {
				session.setAttribute("succMsg", "comment updated");
				resp.sendRedirect("doctorPage/patient.jsp");
			} else {
				session.setAttribute("errorMsg", "somthing wrong");
				resp.sendRedirect("doctorPage/patient.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
