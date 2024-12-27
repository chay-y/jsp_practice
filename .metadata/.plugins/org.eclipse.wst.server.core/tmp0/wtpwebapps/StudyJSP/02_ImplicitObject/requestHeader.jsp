<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력하기</h2>
	<%
		//요청 헤더의 이름들을 반환하여 저장
		Enumeration headers = request.getHeaderNames();
	
		//요청헤더명이 있는지 확인
		while(headers.hasMoreElements()){
			
			//헤더명이 있으면 헤더의 이름을 가져옴
			String headerName = (String) headers.nextElement();
			
			//이름에 해당하는 값을 얻어와서 출력
			String headerValue = request.getHeader(headerName);
			out.println("헤더명 : " + headerName + ", 헤더값" + headerValue + "<br>");
		}
	
	%>
</body>
</html>