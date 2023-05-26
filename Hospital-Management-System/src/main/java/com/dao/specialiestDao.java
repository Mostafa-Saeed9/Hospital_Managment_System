package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialiest;

public class specialiestDao {

	private Connection conn;

	public specialiestDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addSpecialiest(String specName) {
		boolean f = false;

		try {

			String sql = "insert into specialiests (spec_name) values (?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, specName);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Specialiest> getAllSpecialiests() {

		List<Specialiest> list = new ArrayList<Specialiest>();
		Specialiest s = null;
		try {
			String sql = "select * from specialiests";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specialiest();
				s.setId(rs.getInt(1));
				s.setSpecialiestName(rs.getString(2));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
