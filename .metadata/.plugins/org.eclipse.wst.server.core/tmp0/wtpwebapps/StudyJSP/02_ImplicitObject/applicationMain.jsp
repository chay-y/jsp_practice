<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에 설정한 내용 읽어오기</h2>
	<p>초기화 매개변수 : <%=application.getInitParameter("INIT_PARAM") %>
	
	<h2>서버의 물리적 경로 가져오기</h2>
	<p>application 내장 객체 : <%=application.getRealPath("/02_ImplicitObject") %>
	
	<h2>선언부에서 application 내장 객체 사용하기</h2>
	
	<%!
		public String useImplicationObject(){
		return this.getServletContext().getRealPath("/02_ImplicitObject");
		}
	
		public String useImplicitObject(ServletContext app){
			return app.getRealPath("/02_ImplicitObject");
		}
	%>
	
	<ul>
		<li>this사용 : <%=useImplicationObject() %></li>
		<li>내장 객체를 인수로 전달 : <%=useImplicitObject(application) %></li>
	</ul>
</body>
</html>