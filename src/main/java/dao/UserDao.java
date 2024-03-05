package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.User;
import mysql.MysqlConnector;

public class UserDao {
	private static Connection con;
	private static PreparedStatement pst;
	private static MysqlConnector mysql = new MysqlConnector();
	private static String query = "";

	// Login
	public static User userLogin(String email, String pass) {
		con = mysql.getConnection();
		User user = null;
		try {
			query = "SELECT * FROM user WHERE email=? AND password=?";
			pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setIs_admin(rs.getInt("is_admin"));
				user.setAvatar(rs.getString("avatar"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// Register
	public static boolean userRegister(User user) {
		con = mysql.getConnection();
		try {
			query = "INSERT INTO user(name,email,address,password) VALUES(?,?,?,?)";
			pst = con.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getAddress());
			pst.setString(4, user.getPassword());
			int rs = pst.executeUpdate();
			if (rs > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// getAll
	public static List<User> getAll() {
		List<User> user = new ArrayList<>();
		try {
			query = "SELECT * FROM user";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				user.add(new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"), rs.getString("address"), rs.getInt("is_admin"),
						rs.getString("avatar")));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

	// Insert
	public static boolean addUser(User u) {
		try {
			query = "INSERT INTO user(name, email, password, address, avatar) VALUES(?,?,?,?,?)";
			pst = con.prepareStatement(query);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getPassword());
			pst.setString(4, u.getAddress());
			pst.setString(5, u.getAvatar());
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

	// Select By ID
	public static User selectUser(int id) {
		User user = new User();
		try {
			query = "SELECT * FROM user WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setIs_admin(rs.getInt("is_admin"));
				user.setAvatar(rs.getString("avatar"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// Update
	public static boolean updateUser(User u, int id) {
		try {
			query = "UPDATE user SET name=?, email=?, address=?, avatar=? WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getAddress());
			pst.setString(4, u.getAvatar());
			pst.setInt(5, id);
			int row = pst.executeUpdate();
			if (row > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Delete
	public static void deleteUser(int id) {
		try {
			List<Order> orders = OrderDao.getOrderByUserId(id);
			if (orders.size()>0) {
				int order_id = orders.get(0).getId();
				// Xóa đơn hàng và ctdh trước
				OrderDao.deleteOrder(order_id);
			}
			query = "DELETE FROM `user` WHERE id =?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
