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
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	PreparedStatement ps = null;

	try {
		String sql = "delete from member where id = ? and passwd = ?";
		ps.setString(1, id);
		ps.setString(2, passwd);
		ps = conn.prepareStatement(sql);
		int count = ps.executeUpdate();
		if (count > 0) {
			out.print("회원 탈퇴가 완료되었습니다.");
		} else {
			out.print("아이디 혹은 비밀번호가 잘못되었습니다.");
		}

	} catch (SQLException se) {
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
	}
	%>



</body>
</html>