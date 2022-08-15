package mvc.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	private static String driverClass = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul";
	private static String username = "root";
	private static String password = "12345";
	
    //DB 연결 메서드
	public static Connection getConnention() {
		try {
			Class.forName(driverClass);
			return DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//DB 연결 종료 메서드
	public static void close(Connection conn, PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pstmt = null;
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				conn = null;
			}
		}
	}
	
	//연결 종료(ResultSet이 있는 경우)
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pstmt = null;
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				conn = null;
			}
		}
	}
}
