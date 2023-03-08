<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Calendar"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
	%>
	<jsp:forward page="10_02_viewTime.jsp"></jsp:forward>
</body>
</html>