<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	String mariaDriver = application.getInitParameter("MariaDriver");
	String mariaURL = application.getInitParameter("mariaURL");
	String mariaId = application.getInitParameter("mariaId");
	String mariaPwd = application.getInitParameter("mariaPwd");
	
	MemberDAO dao = new MemberDAO(mariaDriver, mariaURL, mariaId, mariaPwd);
	
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	
	dao.close();
	
	if(memberDTO.getId()!=null){
		session.setAttribute("userId", memberDTO.getId());
		session.setAttribute("userName", memberDTO.getName());
		response.sendRedirect("loginForm.jsp");	
	}else{
		request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
		
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
	}
	
%>