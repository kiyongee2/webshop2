package mvc.common;

import java.sql.Connection;

public class JDBCUtilTest {

	public static void main(String[] args) {
		Connection con = JDBCUtil.getConnention();
		System.out.println(con + " DB 연결 객체 생성");
	}

}
