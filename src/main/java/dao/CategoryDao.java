package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import mysql.MysqlConnector;

public class CategoryDao {
	private static Connection con;
	private static PreparedStatement pst;
	private static String query;
	private static MysqlConnector mysql = new MysqlConnector();
	private static ResultSet rs;

	public static List<Category> getAll() {
		List<Category> category = new ArrayList<>();
		con = mysql.getConnection();
		try {
			query = "select * from categories";
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				category.add(new Category(id, name));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return category;
	}

	// Insert
	public static boolean addCategory(String name) {
		try {
			query = "INSERT INTO categories(name) VALUES(?)";
			pst = con.prepareStatement(query);
			pst.setString(1, name);

			int row = pst.executeUpdate();
			if (row > 0) {
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	// Insert
	public static boolean deleteCategory(int id) {
		try {
			query = "DELETE FROM categories WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);

			int row = pst.executeUpdate();
			if (row > 0) {
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	// Update
	public static boolean updateCategory(String name, int id) {
		try {
			query = "UPDATE categories SET name=? WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setInt(2, id);
			int row = pst.executeUpdate();
			if (row > 0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	// Select By Id
	public static Category selectCategory(int id) {
		Category c = new Category();
		try {
			query = "SELECT * FROM categories WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
}
