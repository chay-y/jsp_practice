<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>Include 페이지</h3>

<%
	//모든 속성값은 Object타입으로 저장되어 있으므로
	//원래 타입으로 형변환하여 출력
	int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
	String pString2 = pageContext.getAttribute("pageString").toString();
	Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>
	
<ul>
	<li>Integer 객체 " <%=pInteger2 %></li>
	<li>String 객체 " <%=pString2 %></li>
	<li>Person 객체 " <%=pPerson2.getName() %>, <%=pPerson2.getAge() %></li>
</ul>
