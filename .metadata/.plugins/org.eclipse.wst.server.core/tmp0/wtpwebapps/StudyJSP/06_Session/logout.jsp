<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//방법1. 설정한 속성만 삭제
	session.removeAttribute("UserID");
	session.removeAttribute("UserName");
	
	//방법2. 모든 속송을 한꺼번에 삭제
	session.invalidate();
	
	response.sendRedirect("loginForm.jsp");
%>