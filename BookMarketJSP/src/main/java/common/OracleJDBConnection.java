package common;

import java.sql.Connection;     
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleJDBConnection extends JDBConnection {

	public Connection OJDBConnection() {
		
		final String jdbcDriverClassName = "oracle.jdbc.OracleDriver";
		final String url = "jdbc:oracle:thin:@localhost:1521:xe";
		final String userid = "c##JAVA";
		final String passwd = "1111";
				
		try {
			// JDBC 드라이버 loading
			Class.forName(jdbcDriverClassName);
			
			// Connection 객체 생성
			conn = DriverManager.getConnection(url, userid, passwd);
			
			System.out.println("오라클 DB 연결 성공");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}			

		return conn;
			
	}
	
	
}
