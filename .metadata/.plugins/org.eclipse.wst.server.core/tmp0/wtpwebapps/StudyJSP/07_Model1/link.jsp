<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="90%">
	<tr>
		<td align="center">
			<% if (session.getAttribute("UserID")==null){ %>
				<a herf="">[ 로그인 ]</a> 
			<%}else{ %>
				<a herf="">[ 로그아웃 ]</a>
			<%} %>
			
			&nbsp;&nbsp;&nbsp;
			<a herf = "">[ 게시판 ]</a>
		</td>
	</tr>
</table>