package admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.specialiestDao;
import com.db.DBConnect;

@WebServlet("/addSpecialiest")
public class addSpecialies extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		specialiestDao dao = new specialiestDao(DBConnect.getConn());

		String specName = req.getParameter("specName");
		HttpSession session = req.getSession();
		boolean f = dao.addSpecialiest(specName);

		if (f) {
			session.setAttribute("SSMsg", "specialiest added successfully");
			resp.sendRedirect("admin/index.jsp");
			// System.out.println("inserted successfully");
		} else {

			session.setAttribute("ESMsg", "invalid");
			resp.sendRedirect("admin/index.jsp");
			// System.out.println("somthing wrong on server....");
		}
	}

}
