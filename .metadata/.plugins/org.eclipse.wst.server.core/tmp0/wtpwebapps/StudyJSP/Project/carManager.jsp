<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>차량 관리 화면</h2>
	<center>
		<table border="1">
			<tr>
				<td><a herf="carMain.jsp">홈</a></td>
				<td><a herf="carManager.jsp">차량관리</a></td>
				<td><a herf="carSellInfo.jsp">판매 정보 등록</a></td>
				<td><a herf="carSellList.jsp">판매 목록</a></td>
			</tr>
		</table>
		
		<h3>- 차량등록</h3>
		<br>
		
		<form action="carManagerProcess.jsp" method="post" name="">
			<p>제조사
				<select name="makesr">
					<option value="현대">현대</option>
					<option value="기아">기아</option>
					<option value="쌍용">쌍용</option>
				</select>
			</p>
			<p>모델명 <input type="text" name="modleName"></p>
			<p>차량가격 <input type="text" name="price"></p>
		<input type="submit" value="등록">
		</form>
		
		<h3>- 차량목록</h3>
		<br>
		
		<table border="1">
			<tr>
				<td>모델번호</td>
				<td>모델명</td>
				<td>제조사</td>
			</tr>
<%
		JDBConnect jdbc = new JDBConnect();	

		String sql = "select * from CAR_INFO";
			
		Statement stmt = jdbc.con.createStatement();

		ResultSet rs = stmt.executeQuery(sql);
				
		while(rs.next()){
			String modelNum = rs.getString("modelNum");
			String modleName = rs.getString("modleName");
			String maker = rs.getString("maker");
%>
			<tr>
				<td><%= modelNum %></td>
				<td><%= modleName%></td>
				<td><%= maker %></td>
			</tr>
<%
		}
		jdbc.close();
%>
		</table>
	</center>
</body>
</html>