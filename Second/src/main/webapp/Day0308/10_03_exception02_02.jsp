<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 처리</title>
</head>
<body>
	<h2>에러처리 : exception내장 객체 사용</h2>
	<p>
		요청 처리 과정에서 에러가 발생하엿습니다. <br> 빠른 시간 내에 문제를 해결하도록 하겠습니다. <br>



	</p>
	에러 타입 :
	<%=exception.getClass()%>
<%-- 에러 타입 : <%=exception.getClass().getName() %> <br> --%>
	<br> 에러 메세지 :
	<%=exception.getMessage()%>


</body>
</html>