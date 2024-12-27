<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//설정타입이 Object이므로
	//객체가 아닌 기본형을 저장할 때는 오토박싱되어 객체 형태로 저장됨
	pageContext.setAttribute("pageInteger", 1000);
	pageContext.setAttribute("pageString", "페이지 영역의 문자열");
	pageContext.setAttribute("pagePerson", new Person("김그린",22));
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
		//모든 속성값은 Object타입으로 저장되어 있으므로
		//원래 타입으로 형변환하여 출력
		int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
		String pString = pageContext.getAttribute("pageString").toString();
		Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	
	<ul>
		<li>Integer 객체 " <%=pInteger %></li>
		<li>String 객체 " <%=pString %></li>
		<li>Person 객체 " <%=pPerson.getName() %>, <%=pPerson.getAge() %></li>
	</ul>
	
	<h2>include된 파일에서 page영역 읽어오기</h2>
	<%@ include file= "pageInclude.jsp" %>
	
	<h2>페이지 이동 후 page영역 읽어오기</h2>
	<a href="pageLocation.jsp">pageLocation.jsp 바로가기</a>
</body>
</html>