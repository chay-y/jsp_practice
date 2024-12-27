<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect();	
	
		String id = "test1";
		String pass = "1234";
		String name = "회원";
		
		//실행할 쿼리문 작성
		//?:인파라미터, 나중에 값을 채워줄 예정이다 라는 의미
		String sql = "INSERT INTO member Values(?,?,?)";
		
		//인파라미터가 있는 동적 쿼리문을 실햏하기위해서
		//PreparedStatement객체를 생성하고 sql문을 매개변수로 전달
		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
		
		//인파라미터에 값을 채움..
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
	
		//쿼리 실행 후 실행 된 레코드의 수가 리턴됨
		int intResult = pstmt.executeUpdate();
		out.println(intResult + "행이 입력되었습니다");
		
		jdbc.close();
		
	%>
</body>
</html>