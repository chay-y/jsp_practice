<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	JDBConnect jdbc = new JDBConnect();	

	String modelNum = request.getParameter("modelNum");
	String maker = request.getParameter("maker");
	String modleName = request.getParameter("modleName");
	String price = request.getParameter("price");
				
	String squl="INSERT INTO CAR_INFO Values(?,?,?)";
			
	PreparedStatement pstmt = jdbc.con.prepareStatement(squl);
				
	pstmt.setString(1, maker);
	pstmt.setString(2, modleName);
	pstmt.setString(3, price);
				
	pstmt.executeUpdate();
%>