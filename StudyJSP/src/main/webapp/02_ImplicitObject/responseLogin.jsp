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
		request.setCharacterEncoding("UTF-8");
		
		//request내장객체로 전송된 매개변수 값을 읽어와서 변수에 저장
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_pwd");
		
		//아이디아 패스워드가 일치하면
		if (id.equals("admin") && pwd.equals("1234")){
			//페이지를 이동(자바스크립트의 location.href와 같은 기능임)
			response.sendRedirect("responseWelcom.jsp");
		}else{
			//실패하면 로그인페이지로 포워드됨.
			request.getRequestDispatcher("responseMain.jsp?loginErr=1").forward(request, response);
		}
	%>
	
</body>
</html>