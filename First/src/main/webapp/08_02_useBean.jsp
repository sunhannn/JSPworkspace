<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="memberBean" class="com.dto.MemberBean"></jsp:useBean>
	<!-- property : 멤버 변수명을 의미함.  -->

	<jsp:setProperty name="memberBean" property="id" value="2" />

	<%="아이디 : " + memberBean.getId()%>
	<br> 이름 :
	<jsp:getProperty property="name" name="memberBean" /></body>
</html>