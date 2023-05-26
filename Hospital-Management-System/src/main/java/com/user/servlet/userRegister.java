package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class userRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String name = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User u = new User(name, email, password);
			userDao dao = new userDao(DBConnect.getConn());

			boolean f = dao.userRegister(u);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("sucMsg", "data inserted successfully");
				resp.sendRedirect("signup.jsp");
				// System.out.println("inserted successfully");
			} else {

				session.setAttribute("errorMsg", "somthing wrong on server....");
				resp.sendRedirect("signup.jsp");
				// System.out.println("somthing wrong on server....");
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
