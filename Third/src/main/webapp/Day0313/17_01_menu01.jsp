<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
div.navbar-brand {
	margin: auto 0 auto auto !important;
}

div.navbar-brand a {
	text-decoration: none;
	color: #fff;
}
</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	<a class="navbar-brand" href="17_01_welcome.jsp">home</a>
	<ul class="navbar-nav">
		<li class=nav-item"><a class="nav-link" href="#">상품목록</a></li>
	</ul>
</nav>
<%-- <%if(request.isUserInRole("users") || request.isUserInRole("manager")==true) %> --%>
<%
if (request.isUserInRole("users") || request.isUserInRole("manager")) {
%>
<div class="navbar-brand">
	<a href="17_01_Logout.jsp">로그아웃</a>
</div>
<div class="navbar-brand">
	<a href="17_01_Login.jsp">로그인</a>
</div>
<%
} else {
%>
<div class="navbar-brand">
	<a href="17_01_Login.jsp">로그인</a>
</div>
<%
}
%>
</html>