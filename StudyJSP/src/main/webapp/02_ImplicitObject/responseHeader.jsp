<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat s =new SimpleDateFormat("yyyy-MM-dd");
	long add_date = s.parse(request.getParameter("add_date")).getTime();
	
	//폼에서 전송되는 값은 항상 string타입
	int add_int = Integer.parseInt(request.getParameter("add_int"));
	String add_str = request.getParameter("add_str");
	
	//응답 헤더에 값을 추가
	response.addDateHeader("today", add_date);
	
	//같은 헤더명으로 새로운 값을 추가하면
	//add인 경우에는 같은 헤더명으로 값이 하나 더 추가됨
	response.addIntHeader("number", add_int);
	response.addIntHeader("number", 5678);
	
	//set메서드의 경우 같은 이름으로 작성하면 이전 값이 변경됨.
	//같은 이름의 헤더가 없으면 새로 추가됨
	response.addHeader("name", add_str);
	response.setHeader("name", "정제이");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<h2>응답 헤더 정보 출력하기</h2>
	
	<%
		Collection<String> headerNames=response.getHeaderNames();
		for(String hName : headerNames){
			String hValue = response.getHeader(hName);
	%>
		<p><%=hName%> : <%=hValue %></p>
	<%
		}
	%>
	
	<h2>number만 출력하기</h2>
	<%
		Collection<String> number = response.getHeaders("number");
	
		for(String num : number){
	%>
	
		<p> number: <%=num %></p>
	<%
		}
	%>
	
</body>
</html>