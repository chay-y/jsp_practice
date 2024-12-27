<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>판매 정보 등록 화면</h2>
	<center>
		<table border="1">
			<tr>
				<td><a herf="carMain.jsp">홈</a></td>
				<td><a herf="carManager.jsp">차량관리</a></td>
				<td><a herf="carSellInfo.jsp">판매 정보 등록</a></td>
				<td><a herf="carSellList.jsp">판매 목록</a></td>
			</tr>
		</table>
		<br>
		<form action="carSellInfoProcess.jsp" method="post" name="">
			<p>구매자명 <input type="text" name="beyerName"></p>
			<p>색상
				<select name="color">
					<option value="블랙">블랙</option>
					<option value="화이트">화이트</option>
					<option value="실버">실버</option>
					<option value="레드">레드</option>
				</select>
			</p>
			<p>모델
				<select name="maker">
					<option value="현대">현대</option>
					<option value="기아">기아</option>
					<option value="쌍용">쌍용</option>
				</select>
			</p>
			<p>연락처 <input type="text" name="beyerNum"></p>
		<input type="submit" value="등록" href="carSellList.jsp">
		</form>

	</center>
</body>
</html>