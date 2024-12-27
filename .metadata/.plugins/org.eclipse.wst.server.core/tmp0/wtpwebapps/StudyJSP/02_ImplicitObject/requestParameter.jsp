<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		//인코딩 설정 : 한글이 깨지지 않도록 UTF-8로 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		//전송되는 값이 하나인 경우 : 읽어오기(type이 text,radio,password)
		String id = request.getParameter("id");
		String gender = request.getParameter("genter");
		
		//전송되는 값이 여러개인 경우 (type이 checkbox)
		String[] hobby = request.getParameterValues("hobby");
		String hobbyStr= " ";
				
		if (hobby !=null){
			for (int i=0; i<hobby.length; i++){
				hobbyStr += hobby[i] + " ";
			}
		}
		
		String intro = request.getParameter("intro");
	
	%>
	
	<ul>
		<li>아이디 : <%= id %></li>
		<li>성별 : <%= gender %></li>
		<li>취미 : <%= hobbyStr %></li>
		<li>자기소개 : <%= intro %></li>
	</ul>
</body>
</html>