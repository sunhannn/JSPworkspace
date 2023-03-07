<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <jsp:useBean id="person" class="com.dto.Person"/> --%>
	<jsp:useBean id="person" class="com.dto.Person" scope="request" />
	<!-- Action Tag는 닫는 태그가 존재해야함 
	scope : 영역설정 
	request : 요청을 보낸 곳과 받은 곳에서 살아있음-->
	
	<p>
		아이디 :
		<%=person.getId()%>
	</p>
	<p>
		이 름 :
		<%=person.getName()%>
	</p>




</body>
</html>