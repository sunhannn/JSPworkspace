<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/18_01_Login.jsp"
		method="post">
		아이디 <input type="text" name="memberId" required> 암호 <input
			type="password" name="password" required> <input
			type="submit" value=로그인>


	</form>



</body>
</html>