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
	<table width="300" border="1">

		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>


		<%
		ResultSet rs = null;
		// 		Statement stmt = null;
		PreparedStatement stmt = null;

		try {
			String sql = "select * from member";
			stmt = conn.prepareStatement(sql);
			// 			stmt = conn.createStatement();
			// 			rs = stmt.executeQuery(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {

				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
		%>

		<tr>
			<td><%=id%></td>
			<td><%=passwd%></td>
			<td><%=name%></td>
		</tr>

		<%
		}
		} catch (SQLException ex) {
		out.print("데이터베이스 연결이 실패되었습니다. <br>");
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
	</table>
</body>
</html>