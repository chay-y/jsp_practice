<%@page import="board.BoardDTO"%>
<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");

	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dto.selectView(num);
	
	String sessionId = session.getAttribute("UserId").toString();
	if(!sessionId.equals(dto.getId())){
		JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>

</head>
<body>
<%@ include file="../07_Model1/link.jsp" %>

<h2>회원제 게시판 - 상세 보기(View)</h2>
<form name="writeFrm">
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td></td>
            <td>작성자</td>
            <td></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td></td>
            <td>조회수</td>
            <td></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100"></td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
            
                <button type="button">수정하기</button>
                <button type="button">삭제하기</button> 
                <button type="button" onclick="location.href='list.jsp';">
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>