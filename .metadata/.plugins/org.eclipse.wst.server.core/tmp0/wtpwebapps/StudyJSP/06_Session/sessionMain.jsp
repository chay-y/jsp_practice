<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//날짜 표시 형식 설정
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	
	//세션 생성한 시간(최초 요청)을 저장 	
	long creationTime = session.getCreationTime();
	//날짜 표시 형식에 맞춰서 문자열로 변환하여 저장
	String creationTimeStr = dateFormat.format(new Date(creationTime));
	//세션을 마지막으로 요청한 시간을 저장
	long lastTime = session.getLastAccessedTime();
	//날짜 표시 형식에 맞춰 요청한 시간을 저장
	String lastTimeStr = dateFormat.format(new Date(lastTime));
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Session 설정 확인</h2>
	<ul>
		<!-- web.xml에 설정한 세션 유지 시간을 출력  -->
		<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %></li>
		<!-- 웹에서 생성된 세션 id출력 -->
		<li>세션 아이디 : <%=session.getId() %></li>
		<li>세션 요청 시간 : <%=creationTimeStr %></li>
		<li>마지막 요청 시간 : <%=lastTimeStr %></li>
	</ul>
</body>
</html>