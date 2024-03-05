package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.OrderStatus;
import mysql.MysqlConnector;

public class OrderStatusDao {
	private static Connection con;
	private static PreparedStatement pst;
	private static MysqlConnector mysql = new MysqlConnector();
	private static String query = "";

	// Get All
	public static List<OrderStatus> getAll() {
		con = mysql.getConnection();
		List<OrderStatus> ods = new ArrayList<>();
		try {
			query = "select * from `order_status`";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ods.add(new OrderStatus(rs.getInt("id"), rs.getString("name"), rs.getString("color")));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ods;
	}

	// Select
	public static OrderStatus selectOrderStatus(int id) {
		con = mysql.getConnection();
		OrderStatus ods = new OrderStatus();
		try {
			query = "SELECT * FROM `order_status` WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				ods.setId(rs.getInt("id"));
				ods.setName(rs.getString("name"));
				ods.setColor(rs.getString("color"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ods;
	}

	// Insert
	public static boolean insertOrderStatus(OrderStatus ods) {
		con = mysql.getConnection();
		try {
			query = "INSERT INTO `order_status`(name,color) VALUES(?,?)";
			pst = con.prepareStatement(query);
			pst.setString(1, ods.getName());
			pst.setString(2, ods.getColor());
			int row = pst.executeUpdate();
			if(row>0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	// Update
	public static boolean updateOrderStatus(OrderStatus ods, int id) {
		con = mysql.getConnection();
		try {
			query = "UPDATE `order_status` SET name=?, color=? WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setString(1, ods.getName());
			pst.setString(2, ods.getColor());
			pst.setInt(3, ods.getId());
			int row = pst.executeUpdate();
			if(row>0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	// Delete
	public static boolean deleteOrderStatus(int id) {
		con = mysql.getConnection();
		try {
			query = "DELETE FROM `order_status` WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			int row = pst.executeUpdate();
			if(row>0) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
}
