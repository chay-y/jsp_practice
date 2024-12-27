<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
	if("green".equals(user_id) && "1234".equals(user_pw)){
		//아이디 저장하기에 체크를 했으면 쿠키를 생성
		if(save_check != null && save_check.equals("Y")){
			CookieManager.makeCookie(response, "loginId", user_id, 86400);
		}else{
			//체크가 없다면
			//기존에 저장된 쿠키가 있을수도 있으므로 해당 쿠키를 삭제한다.
			CookieManager.deleteCookie(response, "loginId");
		}
	
		JSFunction.alertLocation("로그인 성공", "idSaveMain.jsp", out);
		}else{
			JSFunction.alertBack("로그인 실패", out); 
		}
%>