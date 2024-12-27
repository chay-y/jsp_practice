<%@page import="common.JDBConnect"%>
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
	String depart=request.getParameter("depart");

	//squl문 생성
	String sql="select * from sutdent where depart=?";

	//squl문을 실행하기 위한 객체를 생성(인파라미터의 유무에 따라 객체를 선택하여 생성)
	
	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);

	//인파라미터에 값을 대입
	pstmt.setString(1, depart);
	
	//완성된 쿼리문 실행
	ResultSet rs=pstmt.executeQuery();
 
	//결과를 출력
	if(rs.next()){
		String depart2 = rs.getString("depart");
		
		if(depart.equals(depart2)){
			sql = "update student set depart= ? where depart= ?";
			pstmt = jdbc.con.prepareStatement(sql);
			pstmt.setString(1, depart);
			pstmt.executeUpdate();
			out.println("student 테이블에서 삭제하였습니다..");
		}else{
			out.println("student 테이블을 삭제에 실패하였습니다.");
		}
	}else{
		out.println("sutdent 테이블에 일치하는 학과가 없습니다.");
	}
	
	//연결 닫기
	jdbc.close();
%>
</body>
</html>