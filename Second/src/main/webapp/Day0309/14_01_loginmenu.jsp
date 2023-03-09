<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String) session.getAttribute("userID");

	if (id == null) {
		out.print("비회원 메뉴입니다.");
		out.print("<a href='14_01_login.jsp'>로그인으로 이동</a>");
	} else if (id.equals("admin")) {
		out.print("관리자 메뉴입니다.");
	%>
	<a href="14_01_login_logout.jsp">로그아웃</a>
	<%
	} else {
	out.print("회원 메뉴입니다.");
	%>
	<a href="14_01_login_logout.jsp">로그아웃</a>
	<%
	}
	%>
</body>
</html>