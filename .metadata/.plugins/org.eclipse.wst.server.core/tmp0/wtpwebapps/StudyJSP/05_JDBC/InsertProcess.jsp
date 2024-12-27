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

	<%
		JDBConnect jdbc = new JDBConnect();	
		//db연결
		String num=request.getParameter("num");
		
		//form에서 입력받은 값 가져오기
		String num = request.getParameter("num");	
		String depart = request.getParameter("depart");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		//squl문 생성
		String squl="INSERT INTO sutdent Values(?,?,?,?,?)";
	
		//squl문을 실행하기 위한 객체를 생성(인파라미터의 유무에 따라 객체를 선택하여 생성)
		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
		
		//인파라미터에 값을 대입
		pstmt.setString(1, num);
		pstmt.setString(2, depart);
		pstmt.setString(3, name);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		
		
		//완성된 쿼리문 실행
		pstmt.executeUpdate();
	
		//결과를 출력
		out.print("Student 테이블에 저장하였습니다.");
		
		//연결 닫기
		jdbc.close();
	%>
	

	
</body>
</html>