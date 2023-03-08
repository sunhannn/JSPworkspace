<%@page import="java.util.Currency"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page contentType="text/html; charset=utf-8"%>
	현재 시간은
	<jsp:include file="/common/variable.jsp">
		<%=CURRENT_TIME%>입니다.
		<jsp:include file="/common/footer.jsp"></body>
</html>