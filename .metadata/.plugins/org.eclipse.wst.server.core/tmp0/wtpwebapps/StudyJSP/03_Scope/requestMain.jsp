<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("requestString", "request영역의 문자열");
	request.setAttribute("requestPerson", new Person("정디비", 33));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 영역의 속성값 삭제하기</h2>
	<%
		request.removeAttribute("requestString");
	 	
		//속성이 존재하지 않지만 에러가 발생하지 않음
		request.removeAttribute("requestInteger");
	%>
	
	<h2>request 영역의 속성값 읽기</h2>
	<%
		Person rPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<li>String 객체 : <%= request.getAttribute("requestString") %>
		<li>Person 객체 : <%= rPerson.getName()%>, <%=rPerson.getAge() %>
	</ul>
	
	<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
	<% request.getRequestDispatcher("requestForword.jsp?paramHan=한글&paramEng=English").forward(request, response); %>
</body>
</html>