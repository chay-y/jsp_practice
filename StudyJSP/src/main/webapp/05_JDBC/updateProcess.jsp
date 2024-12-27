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

	String pre_depart = request.getParameter("before_depart");	
	String now_depart = request.getParameter("after_depart");

	String sql="select * from sutdent where depart=?";

	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);

	pstmt.setString(1, before);
	
	ResultSet rs = pstmt.executeUpdate();
 
	if(rs.next()){
		String depart = rs.getString("depart");
		
		if(before.equals(depart)){
			sql = "update student set depart= ? where depart= ?";
			pstmt = jdbc.con.prepareStatement(sql);
			pstmt.setString(1, after);
			pstmt.setString(2, before);
			pstmt.executeUpdate();
			out.println("student 테이블을 변경하였습니다.");
		}else{
			out.println("student 테이블을 변경하지 못했습니다.");
		}
	}else{
		out.println("sutdent 테이블에 일치하는 학과가 없습니다.");
	}
	
	jdbc.close();
%>
		
</body>
</html>