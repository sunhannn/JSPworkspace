<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%@ page trimDirectiveWhitespaces="true" %> <%%>들 공백 제거 --%>
<html>
<head>
<meta charset="UTF-8">
<title>로그 메시지 기록</title>
</head>
<body>
	<%-- 	<%=application.setAttribute("fruit", "apple")%> --%>
	속성 설정 :
	<%=application.getAttribute("fruit")%>
	<%
	application.log("로그 메시지 기록");
	%>
	로그 메시지를 기록합니다.



</body>
</html>