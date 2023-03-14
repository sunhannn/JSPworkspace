<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="20_01_dbconn.jsp"%>
	<%
	// 	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	PreparedStatement stmt = null;
	try {
		String sql = "insert into member(id, passwd, name) values(? ,? ,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		stmt.setString(2, passwd);
		stmt.setString(3, name);
		stmt.executeUpdate(sql);
		out.print("member 테이블 삽입이 성공했습니다.");

	} catch (SQLException ex) {
		out.print("member 테이블 삽입이 실패했습니다. <br>");
		out.print("SQLException :" + ex.getMessage());

	} finally {

		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();

	}
	%>




</body>
</html>