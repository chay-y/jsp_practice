<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./isLoggedin.jsp"%>

<%
	String num=request.getParameter("num");
	
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	//일련번호에 해당하는 기존 게시물 가져오기
	dto = dao.selectView(num);
	
	//로그인 된 id값 확인
	String sessionId = session.getAttribute("UserId").toString();
	
	int delResult=0;
	
	//작성자가 게시글을 삭제하는게 맞는지 확인
	if(sessionId.equals(dto.getId())){
		dto.setNum(num);
		
		//삭제
		delResult = dao.deletePost(dto);
		dao.close();
		
		if(delResult == 1){
			JSFunction.alertLocation("게시글이 삭제되었습니다.", "list.jsp", out);
		}else{
			JSFunction.alertBack("게시글 삭제에 실패하였습니다.",out);
		}
	}else{
		JSFunction.alertBack("작성자 본인만 삭제할 수 있습니다.", out);
		return;
	}
%>