<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

 <%
 	//'하루동안 열지 않음'에 체크를 했으면 "1"을 전달받음
 	String chkVal = request.getParameter("inactiveToday");
 
 	//전달받은 값이 1이면 쿠키를 생성.
 	if(chkVal != null && chkVal.equals("1")){
 		Cookie cookie = new Cookie("PopupClose","off"); //쿠키의 이름, 값을 설정함
 		cookie.setPath(request.getContextPath()); 
 		cookie.setMaxAge(60*60*24); //1일로 시간 설정
 		response.addCookie(cookie);
 		
 		out.println("쿠키 : 하루동안 열지 않음");
 	}
 %>    