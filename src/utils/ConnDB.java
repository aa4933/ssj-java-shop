package utils;

import java.sql.*;

public class ConnDB {
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private Connection conn = null;
	ResultSet rs = null;
	int result = 0;

	public ConnDB() {
	}

	public void OpenConn() throws Exception {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			String url = "jdbc:mysql://localhost:3306/shop?user=root&password=123456&useUnicode=true&characterEncoding=utf-8";
			conn = DriverManager.getConnection(url);
			// stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		} catch (SQLException e) {
			System.err.println("data.executeQuery:" + e.getMessage());
		}
	}

	public void createStmt() throws Exception {
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
		} catch (SQLException e) {
			System.err.println("data.executeQuery:" + e.getMessage());
		}
	}

	public PreparedStatement createPStmt(String sql) throws Exception {
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			System.err.println("data.executeQuery:" + e.getMessage());
		}
		return pstmt;
	}

	public Connection getConn() {
		return conn;
	}

	public ResultSet Query(String sql) {
		rs = null;
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			System.err.println("data.executeQuery:" + e.getMessage());
		}
		return rs;
	}

	public int Update(String sql) {
		try {
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.err.println("data.executeUpdate:" + e.getMessage());
		}
		return result;
	}

	public void closeStmt() {
		try {
			stmt.close();
		} catch (SQLException e) {
			System.err.println("closeStmt:" + e.getMessage());
		}
	}

	public void closeConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.err.println("closeConn:" + e.getMessage());
		}
	}
}
