<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLoggedin.jsp"%>
<%
	//폼의 값을 받아와서 변수에 저장
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//dto생성하고 변경할 내용을 설정
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	//dao생성
	BoardDAO dao = new BoardDAO(application);
	//update실해
	int affected = dao.updateEdit(dto);
	dao.close();
	
	if(affected == 1){
		response.sendRedirect("view.jsp?num="+dto.getNum());
	}else{
		JSFunction.alertBack("게시글 수정하기에 실패하였습니다.", out);
	}
%>