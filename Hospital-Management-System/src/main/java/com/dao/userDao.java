package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userDao {

	Connection conn;

	public userDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User user) {
		boolean f = false;

		try {
			String sql = "insert into user_details (full_name,email,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		}

		catch (Exception e) {
			e.addSuppressed(e);
		}

		return f;
	}

	public User login(String em, String pass) {

		User user = null;

		try {
			String sql = "select * from user_details where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setFullName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from user_details where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update user_details set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}