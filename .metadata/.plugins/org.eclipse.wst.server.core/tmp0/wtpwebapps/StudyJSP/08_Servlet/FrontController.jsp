<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>한번의 매핑으로 여러가지 요청 처리하기</h2>
	<%= request.getAttribute("resultValue") %>
	
	<p>uri:<%=request.getAttribute("uri")%></p>
	<p>요청명:<%=request.getAttribute("commandStr")%></p>
	
	<ul>
		<li><a href="./regist.green">회원가입</a></li>
		<li><a href="./login.green">로그인</a></li>
		<li><a href="./board.green">게시판</a></li>
	</ul>
</body>
</html>