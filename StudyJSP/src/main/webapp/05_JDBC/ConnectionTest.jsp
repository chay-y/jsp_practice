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
	<h2>JDBC 테스트1</h2>
	<%
		JDBConnect jdbc1 = new JDBConnect();
		jdbc1.close();
	%>
	
	<h2>JDBC 테스트2</h2>
	<%
		String driver = application.getInitParameter("MariaDriver");
		String url = application.getInitParameter("MariaURL");
		String id = application.getInitParameter("MariaId");
		String pwd = application.getInitParameter("MariaPwd");
		
		JDBConnect jdbc2= new JDBConnect(driver, url, id, pwd);
		jdbc2.close();
	%>
	
	<h2>JDBC 테스트3</h2>
	<%
		JDBConnect jdbc3 = new JDBConnect(application);
		jdbc3.close();
	%>
</body>
</html>