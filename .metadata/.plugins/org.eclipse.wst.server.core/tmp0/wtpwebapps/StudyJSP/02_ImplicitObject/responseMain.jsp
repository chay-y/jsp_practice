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
		String loginErr = request.getParameter("loginErr");
	
		if(loginErr != null)
			out.print("로그인 실패");
	%>
	
	<form method="post" action="responseLogin.jsp">
		아이디 : <input type="text" name="user_id"> <br>
		비밀번호 : <input type="text" name="user_pwd"> <br><br>
		<input type="submit" value="로그인">
	</form>

	<br><br><br>
	
	<h2>1. HTTP 응답 헤더 설정하기</h2>
	<form action="responseHeader.jsp" method="get">
		<p> 날짜 형식 : <input type="text" name="add_date" value="2024-10-08 09:00">
		<p> 숫자 형식 : <input type="text" name="add_int" value="1234">
		<p> 문자 형식 : <input type="text" name="add_str" value="김그린">
		<input type="submit" value="응답 헤더 설정 & 출력">
	</form>
		
</body>
</html>