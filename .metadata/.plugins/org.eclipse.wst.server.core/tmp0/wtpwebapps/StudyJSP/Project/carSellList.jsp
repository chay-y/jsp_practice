<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
	<h2>판매목록화면</h2>
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
		<table>
		<tr>
			<td rowspan="2">No.</td>
			<td colspan="4">구매자정보</td>
			<td colspan="2">차량정보</td>
		</tr>
		<tr>
			<td>구매자명</td>
			<td>연락처</td>
			<td>구매일</td>
			<td>색상</td>
			<td>모델명</td>
			<td>금액</td>
		</tr>
		
	<%
		JDBConnect jdbc = new JDBConnect();	

		String sql = "select * from CAR_INFO, SALES_INFO";
			
		Statement stmt = jdbc.con.createStatement();

		ResultSet rs = stmt.executeQuery(sql);
				
		while(rs.next()){
			String sellNum = rs.getString("sellNum");
			String beyerName = rs.getString("beyerName");
			String beyerNum = rs.getString("beyerNum");
			String sellday = rs.getString("sellday");
			String color = rs.getString("color");
			String modleName = rs.getString("modleName");
			String price = rs.getString("price");
	%>

		<tr>
			<td><%= sellNum%></td>
			<td><%= beyerName%></td>
			<td><%= beyerNum%></td>
			<td><%= sellday%></td>
			<td><%= color%></td>
			<td><%= modleName%></td>
			<td><%= price%></td>
		</tr>
		<%
		}
		jdbc.close();
		%>
		</table>
	</center>
</body>
</html>