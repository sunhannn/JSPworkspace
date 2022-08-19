<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
td {
	border: 1px solid black;
	text-align: center;
	width: 200px;
}
</style>
</head>
<body>
	<form action="LoginServlet" method="post">
		<table align="center">
			<tr>
				<td colspan="2">Login</td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>PASS</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>LEV</td>
				<td><select name="lev">
						<option value="A">admin</option>
						<option value="B">member</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="login"> &nbsp;<input type="reset" value="cancle"></td>
			</tr>
		</table>
		<div style="color: red; text-align: center;">${message}</div>
	</form>
</body>
</html>