package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Order;
import model.OrderDetail;
import model.OrderStatus;
import model.Product;
import model.User;
import mysql.MysqlConnector;

public class OrderDao {
	private static Connection con;
	private static PreparedStatement pst;
	private static MysqlConnector mysql = new MysqlConnector();
	private static String query = "";
	private static int id;

	// Order Detail
	public static List<OrderDetail> getOrderDetail(int id) {
		List<OrderDetail> order_detail = new ArrayList<>();
		try {
			query = "select * from `order_detail` where order_id = ?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Product pd = ProductDao.productDetail(rs.getInt("product_id"));
				OrderDetail odt = new OrderDetail(rs.getInt("id"), rs.getInt("order_id"), pd, rs.getInt("quantity"));
				order_detail.add(odt);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return order_detail;
	}

	// Delete Order
	public static boolean deleteOrder(int id) {
		try {
			deleteOrderDetail(id);
			query = "delete from `order` where id = ?";
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

	// Delete Order detail
	public static boolean deleteOrderDetail(int id) {
		try {
			query = "delete from `order_detail` where order_id = ?";
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
	// Delete Order Detail By Id
	public static boolean deleteOrderDetailById(int id) {
		try {
			query = "delete from `order_detail` where id = ?";
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

	// Get all order
	public static List<Order> getAll() {
		con = mysql.getConnection();
		List<Order> order = new ArrayList<>();
		try {
			query = "SELECT * FROM `order` ORDER BY id DESC";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int user_id = rs.getInt("user_id");
				int status_id = rs.getInt("status_id");

				User user = UserDao.selectUser(user_id);
				OrderStatus ods = OrderStatusDao.selectOrderStatus(status_id);

				Order od = new Order(
						rs.getInt("id"), 
						user, 
						rs.getInt("total"), 
						rs.getInt("method"), 
						rs.getInt("phone"),
						rs.getString("note"), 
						rs.getString("address"), 
						ods
				);
				
				order.add(od);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return order;
	}

	// Select Order
	public static Order selectOrder(int id) {
		Order od = new Order();
		try {
			query = "select * from `order` where id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				int status_id = rs.getInt("status_id");

				OrderStatus ods = OrderStatusDao.selectOrderStatus(status_id);

				od.setId(rs.getInt("id"));
				od.setTotal(rs.getInt("total"));
				od.setMethod(rs.getInt("method"));
				od.setNote(rs.getString("note"));
				od.setStatus(ods);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return od;
	}
	// Select Order By User Id
	public static List<Order> getOrderByUserId(int id) {
		List<Order> orders = new ArrayList<>();
		
		Order od = new Order();
		try {
			query = "select * from `order` where user_id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int status_id = rs.getInt("status_id");
				
				OrderStatus ods = OrderStatusDao.selectOrderStatus(status_id);
				
				od.setId(rs.getInt("id"));
				od.setTotal(rs.getInt("total"));
				od.setMethod(rs.getInt("method"));
				od.setNote(rs.getString("note"));
				od.setStatus(ods);
				
				orders.add(od);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return orders;
	}

	// Update Order
	public static boolean updateOrder(Order od, int id) {
		try {
			query = "update `order` " + "set total=?, method=?, note=?, status_id=? where id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, od.getTotal());
			pst.setInt(2, od.getMethod());
			pst.setString(3, od.getNote());
			pst.setInt(4, od.getStatus().getId());
			pst.setInt(5, id);

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

	// Create Order
	public static boolean createOrder(int user_id, String address, String note, int phone, int total, int method,
			List<Cart> cartProduct) {
		con = mysql.getConnection();
		try {
			query = "INSERT INTO `order`(`user_id`, `total`, `method`, `note`, `phone`, `address`) VALUES (?,?,?,?,?,?)";
			pst = con.prepareStatement(query);
			pst.setInt(1, user_id);
			pst.setInt(2, total);
			pst.setInt(3, method);
			pst.setString(4, note);
			pst.setInt(5, phone);
			pst.setString(6, address);
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		createOrderDetail(cartProduct);
		return false;
	}

	// Get LastedOrderID
	public static int getLastedOrderId() {
		try {
			query = "SELECT id from `order` ORDER BY id DESC LIMIT 1";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				id = rs.getInt("id");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return id;
	}
	// Created Order Detail
	public static void createOrderDetail(List<Cart> cartProduct) {
		int order_id = getLastedOrderId();
		for (Cart c : cartProduct) {
			try {
				query = "INSERT INTO `order_detail`(`order_id`, `product_id`, `quantity`) VALUES (?,?,?)";
				pst = con.prepareStatement(query);
				pst.setInt(1, order_id);
				pst.setInt(2, c.getId());
				pst.setInt(3, c.getQuantity());
				pst.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
