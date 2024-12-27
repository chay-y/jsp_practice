<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session영역에 UserId속성값이 있는지 확인
	if (session.getAttribute("UserId")==null){
		
		//로그인을 안했다면 알림차을 표시 후 로그인 페이지로 이동
		JSFunction.alertLocation("로그인 후 이용해주세요","../06_Session/loginForm.jsp",out);
		//특정한 조건에서 실행을 멈추고 싶을 때 return을 작성함
		return;
	}

%>