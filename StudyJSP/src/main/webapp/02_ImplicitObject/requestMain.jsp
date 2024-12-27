<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>1. 클라이언트와 서버의 환경정보 읽어오기</h2>
	<a href="">GET 방식으로 전송</a>
	
	<br><br>
	
	<form method="post" action="requestInfo.jsp">
	
		영어 : <input type="text" name="eng" value="bye"><br>
		한글 : <input type="text" name="kor" value="잘가"><br>
		<input type="submit" value="post전송방식">
		
	</form>
	
	<br><br><br>
	
	<h2>2. 클라이언트의 요청 매개변수 읽어오기</h2>
	<form method="post" action="">
	
		아이디 : <input type="text" name="id" value=""><br>
		성별 : <input type="radio" name="gender" value="man"> 남자
			  <input type="radio" name="gender" value="woman"> 여자
		<br>
		취미 : <input type="checkbox" name="hobby" value="game"> 게임
			  <input type="checkbox" name="hobby" value="sports"> 운동
			  <input type="checkbox" name="hobby" value="tour"> 여행
		<br>
		자기소개 : <textarea name="intro" cals="30" rows="4"></textarea>
		<br>
		<input type="submit" value="전송하기">

	</form>
	
	<br><br>
	
	<h2>3. HTTP 요청 헤더 정보 읽어오기</h2>
</body>
</html>