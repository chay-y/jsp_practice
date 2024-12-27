<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>application 영역의 공유</h2>
	<%
		Map<String, Person> maps = new HashMap();
		maps.put("p1", new Person("박제이", 55));
		maps.put("p2", new Person("오디비", 33));
		
		application.setAttribute("maps",maps);
	%>
	
	application 영역에 속성이 저장되었습니다.
</body>
</html>