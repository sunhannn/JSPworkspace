<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src='js/jquery.js'></script>
</head>
<body>

<form method="post">
 
 <jsp:include page="header.jsp" flush="true" />
 <div style="width:100%; height: 200px;" ></div>
 
<h1 style="text-align: center;">예.약.하.기&nbsp;&nbsp;위.해.서.는&nbsp;&nbsp; 로.그.인.을&nbsp;&nbsp; 해.주.셔.야.&nbsp;&nbsp;합.니.다.</h1>

<div style="width:100%; height: 100px;"></div><!-- 글자사이의 간격을 띄우기위한 div -->
 <button type="button" style="width: 200px; height:50px; border: 3px solid green; color: green; margin-left:750px; margin-right:750px;" 
 onclick="location.href='../mainPage/main.jsp'">메인으로 돌아가기</button>



 <div style="width: 100%; height: 300px;"></div>
	<!--본문과 footer를 나누기위한 div-->
	<jsp:include page="footer.jsp" flush="true"/>
</form>
</body>
</html>