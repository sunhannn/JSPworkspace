<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<%!int data = 50;%>
	<%
	out.print("Value of the variable is :" + data + "<br>");
	String data = "하하하";
	out.print("2_Value of the variable is :" + data);
	%>



</body>
</html>