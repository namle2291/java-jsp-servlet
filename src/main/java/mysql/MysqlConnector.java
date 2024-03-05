package mysql;

import java.sql.Connection;
import java.sql.DriverManager;

public class MysqlConnector {
	private static Connection con = null;

	private String dbHost = "jdbc:mysql://localhost:3306/java_web";
	private String dbName = "root";
	private String dbPassword = "";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";

	public Connection getConnection() {
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbHost, dbName, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
