<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	JDBConnect jdbc = new JDBConnect();	

	String beyerName = request.getParameter("beyerName");
	String color = request.getParameter("color");
	String maker = request.getParameter("maker");
	String beyerNum = request.getParameter("beyerNum");
				
	String squl="INSERT INTO CAR_INFO Values(?,?,?,?)";
			
	PreparedStatement pstmt = jdbc.con.prepareStatement(squl);
				
	pstmt.setString(1, beyerName);
	pstmt.setString(2, color);
	pstmt.setString(3, maker);
	pstmt.setString(4, beyerNum);
				
	pstmt.executeUpdate();
%>