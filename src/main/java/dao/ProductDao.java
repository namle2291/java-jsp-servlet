package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.Category;
import model.Product;
import mysql.MysqlConnector;

public class ProductDao {
	private static Connection con;
	private static PreparedStatement pst;
	private static MysqlConnector mysql = new MysqlConnector();
	private static String query = "";

	public static List<Product> getAll() {
		con = mysql.getConnection();
		List<Product> product = new ArrayList<>();
		try {
			query = "SELECT * FROM `product`";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				
				Category category = CategoryDao.selectCategory(rs.getInt("category_id"));
				
				product.add(new Product(rs.getInt("id"), 
						rs.getString("name"),  
						rs.getString("image"), 
						rs.getString("description"), 
						rs.getInt("price"), 
						category,
						rs.getInt("stock")
				));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return product;
	}

	// Lấy danh sách sản phẩm trong cart
	public static List<Cart> getCartProducts(List<Cart> listCart) {
		// Tạo mảng products
		List<Cart> products = new ArrayList<>();
		try {
			// Kiểm tra listCart null
			if (listCart.size() > 0) {
				// Cho vòng lặp truy vấn theo id sản phẩm
				for (Cart c : listCart) {
					query = "select * from product where id = ?";
					pst = con.prepareStatement(query);
					pst.setInt(1, c.getId());
					ResultSet rs = pst.executeQuery();
					// add sản phẩm
					while (rs.next()) {
						Cart row = new Cart();
						
						Category category = CategoryDao.selectCategory(rs.getInt("category_id"));
						
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setImage(rs.getString("image"));
						row.setCategory(category);
						row.setPrice(rs.getInt("price"));
						row.setQuantity(c.getQuantity());
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return products;
	}

	// Tính tổng tiền cart
	public static int getTotalPrice(List<Cart> listCart) {
		int sum = 0;
		try {
			if (listCart.size() > 0) {
				for (Cart c : listCart) {
					query = "select price from product where id=?";
					pst = con.prepareStatement(query);
					pst.setInt(1, c.getId());
					ResultSet rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getInt("price") * c.getQuantity();
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sum;
	}

	// Sản phẩm theo danh mục
	public static List<Product> productCategory(int id) {
		List<Product> products = new ArrayList<>();
		try {
			query = "select * from product where category_id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product pd = new Product();
				pd.setId(rs.getInt("id"));
				pd.setName(rs.getString("name"));
				pd.setPrice(rs.getInt("price"));
				pd.setDescription(rs.getString("description"));
				pd.setImage(rs.getString("image"));
				products.add(pd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	// Tìm kiếm
	public static List<Product> productFilter(String key){
		List<Product> products = new ArrayList<>();
		try {
			pst = con.prepareStatement("SELECT * FROM product WHERE name LIKE ?");
			pst.setString(1, "%" + key + "%");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				
				Category category = CategoryDao.selectCategory(rs.getInt("category_id"));
				
				products.add(new Product(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("image"),
						rs.getString("description"),
						rs.getInt("price"),
						category,
						rs.getInt("stock")
				));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	// chi tiết sản phẩm
	public static Product productDetail(int id) {
		Product pd = new Product();
		try {
			query = "select * from product where id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				Category category = CategoryDao.selectCategory(rs.getInt("category_id"));				
				pd.setId(rs.getInt("id"));
				pd.setName(rs.getString("name"));
				pd.setImage(rs.getString("image"));
				pd.setDescription(rs.getString("description"));
				pd.setPrice(rs.getInt("price"));
				pd.setCategory(category);
				pd.setStock(rs.getInt("stock"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pd;
	}
	// Insert
	public static boolean insertProduct(Product pd) {
		try {
			query = "INSERT INTO product(name, price, description, image, category_id, stock) VALUES(?,?,?,?,?,?)";
			
			pst = con.prepareStatement(query);
			pst.setString(1, pd.getName());
			pst.setInt(2, pd.getPrice());
			pst.setString(3, pd.getDescription());
			pst.setString(4, pd.getImage());
			pst.setInt(5, pd.getCategory().getId());
			pst.setInt(6, pd.getStock());
			
			int row = pst.executeUpdate();
			if(row > 0) {
				return true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;				
	}
	// Delete
	public static boolean deleteProduct(int id) {
		try {
			query = "DELETE FROM product WHERE id=?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			
			int row = pst.executeUpdate();
			if(row > 0) {
				return true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	// Update
		public static boolean updateProduct(Product pd, int id) {
			try {
				query = "UPDATE product SET name=?, price=?, description=?, image=?, category_id=?, stock=? WHERE id=?";
				
				pst = con.prepareStatement(query);
				pst.setString(1, pd.getName());
				pst.setInt(2, pd.getPrice());
				pst.setString(3, pd.getDescription());
				pst.setString(4, pd.getImage());
				pst.setInt(5, pd.getCategory().getId());
				pst.setInt(6, pd.getStock());
				pst.setInt(7, id);
				
				int row = pst.executeUpdate();
				if(row > 0) {
					return true;
				}else {					
					return false;				
				}
				
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return false;				
		}
}
