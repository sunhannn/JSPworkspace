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
	<%@ include file="20_01_dbconn.jsp"%>
	<%
	// request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	ResultSet rs = null;
	Statement stmt = null;

	try {
		String sql = "select id, passwd from member where id = '" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if (rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");

			if (id.equals(rId) && passwd.equals(rPasswd)) {
		sql = "update member set name = '" + name + "' where id = '" + id + "'";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		out.print("Member 테이블 수정완료");
			} else {
		out.print("일치하는 비밀번호가 아닙니다.");
			}
		} else {
			out.print("member 테이블에 일치하는 아이디가 없습니다.");
		}
	} catch (SQLException ex) {
		out.print("SQLException :" + ex.getMessage());
	} finally {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();

	}
	%>




</body>
</html>