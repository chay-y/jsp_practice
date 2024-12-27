<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 글쓰기 페이지에서 세션 유지 시간이 지날동안 동작이 없었다면
	로그인이 헤제되므로 글을 등록하는 시점에서 로그인 상태가 맞는지 확인하기 위해 인클루드함 -->
<%@ include file="./isLoggedin.jsp"%>

<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	
	dto.setId(session.getAttribute("UserId").toString());
	
	BoardDAO dao = new BoardDAO(application);
	int iResult = dao.insertWrite(dto);
	dao.close();
	
	if(iResult == 1){
		response.sendRedirect("list.jsp");
	}else{
		JSFunction.alertBack("글쓰기에 실패하였습니다", out);
	}
%>