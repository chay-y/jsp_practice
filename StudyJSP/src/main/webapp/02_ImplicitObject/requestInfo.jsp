<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>클라이언트 IP : <%=request.getRemoteAddr() %></p>
	
	<p>요청 정보 길이 : <%=request.getCharacterEncoding() %></p>
	
	<p>요청 정보 인코딩 : <%=request.getCharacterEncoding() %></p>
	
	<p>컨텐츠 유형 : <%=request.getContentType() %></p>
	
	<p>요청 정보 프로토콜 : <%=request.getProtocol() %></p>
	
	<p>데이터 전송 방식 : <%=request.getMethod() %></p>
	
	<p>요청 URL : <%=request.getRequestURL() %></p>
	
	<p>요청 URI : <%=request.getRequestURI() %></p>
	
	<p>컨텍스트 경로 : <%=request.getContextPath() %></p>
	
	<p>서버이름 : <%=request.getServerName() %></p>
	
	<p>서버 포트번호 : <%=request.getServerPort() %></p>
	
	<p>쿼리스트링 : <%=request.getQueryString() %></p>
	
	<p>전송된 값1 : <%=request.getParameter("eng") %></p>
	
	<p>전송된 값2 : <%=request.getParameter("kor") %></p>
	
</body>
</html>