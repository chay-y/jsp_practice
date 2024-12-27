<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2>로그인 페이지</h2>
	
	<span style="color:red; font-size:18px">
		<!-- request영역에 loginErrMsg 속성이 있는지 확인하고 없으면 공백, 있으면 에러메세지를 그대로 표시 -->
		<%= request.getAttribute("loginErrMsg")==null ?"":request.getAttribute("logginErrMsg")%>
	</span>
	
	<%
	if(session.getAttribute("UserID")==null){	
	%>
	
	<script>
	function validataform(form){
		if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!form.user_pw.value == ""){
			alert("비밀번호를 입력하세요.")
			return false;
		}
	}
	</script>
	
	<form action="loginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
		<p>아이디 : <input type="text" name="user_id"></p>
		<p>패스워드 : <input type="text" name="user_pw"></p>
		<input type="submit" value="로그인">
	</form>
	
	<%
	}else{
	%>
		<%= session.getAttribute("UserName") %> 회원님, 반갑습니다.<br><br>
		<a href = "logout.jsp">[로그아웃]</a>
	<% } %>
</body>
</html>