<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String loginId = CookieManager.readCookie(request, "loginId");

	String cookieCheck = "";
	if(!loginId.equals("")){
		cookieCheck = "checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resource/css/styles.css" rel="stylesheet">
<style>
	.login{
	padding-top: 50px;
	text-align: center;
	padding-bottom: 100px;
	}
</style>
</head>
<body>

	<%@ include file="./header.jsp" %>
	
	<div class="login">
		<form action="idSaveProces.jsp" method="post">
			<p>
				<span>아이디 : </span>
				<input type="text" name="user_id" value="<%=loginId %>">
			</p>
			<p>
				<span>패스워드 : </span>
				<input type="text" name="user_pw">
			</p>
			<p>
				<input type="checkbox" name="save_check" value="Y" <%=cookieCheck %>>
				아이디 저장하기
			</p>
			<input type="submit" value="로그인하기">
		</form>
	</div>
	
</body>
</html>