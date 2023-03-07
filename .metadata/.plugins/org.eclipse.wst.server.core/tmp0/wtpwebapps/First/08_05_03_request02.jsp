<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #000;
}

td, th {
	padding: 10px 20px;
}
</style>
</head>
<body>
	<%
	String hostValue = request.getHeader("host");
	String alValue = request.getHeader("accept-language");
	%>
	<table>
		<tr>
			<th>호스트명</th>
			<th>설정된 언어</th>
		</tr>
		<tr>
			<th><%=hostValue%></th>
			<th><%=alValue%></th>
		</tr>



	</table>



</body>
</html>