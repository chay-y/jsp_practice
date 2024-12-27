package common;

import java.sql.Statement;

import jakarta.servlet.ServletContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DB와의 연결을 관리하는 클래스
public class JDBConnect {

	public Connection con;	//DB와의 연결을 담당
	public Statement stmt;	//인파라미터가 없는 정적 쿼리문을 실행할 때 사용
	public PreparedStatement pstmt;	//인파라미터가 있는 동적 쿼리문을 실행할 때 사용
	public ResultSet rs;	//select문의 결가를 저장할 때 사용
	
	//기본 생성자
	public JDBConnect() {
		try {
			//JDBC 드라이버 읽어오기
			Class.forName("org.mariadb.jdbc.Driver");
			
			//db에 연결하기 위한 값을 설정
			String url = "jdbc:mariadb://localhost:3306/studyjsp";
			String id = "root";
			String pwd = "1234";
			
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(기본생성자)");
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			
			con=DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(매개변수가 있는 생성자1)");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("MariaDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("MariaURL");
			String id = application.getInitParameter("MariaId");
			String pwd = application.getInitParameter("MariaPwd");
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(매개변수가 있는 생성자2)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 연결 해제");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
