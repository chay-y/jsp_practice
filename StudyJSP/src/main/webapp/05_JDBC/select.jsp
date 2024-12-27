<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<table>
		<tr>
			<td>학번</td>
			<td>학과</td>
			<td>이름</td>
			<td>주소</td>
			<td>전화번호</td>
		</tr>
	
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String sql = "select * from student";
		
		Statement stmt = jdbc.con.createStatement();

		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String num = rs.getString("num");
			String depart = rs.getString("depart");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String phone = rs.getString("phone");
		%>
			<!-- out.println(num+" "+depart+" "+name+" "+address+" "+phone); -->
			
			<tr>
				<td><%=num%></td>
				<td><%=depart%></td>
				<td><%=name%></td>
				<td><%=address%></td>
				<td><%=phone%></td>
			</tr>
		<%	
		}
		
		jdbc.close();
	%>
	</table>
	
</body>
</html>