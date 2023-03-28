<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>로그아웃</title>
</head>

<body>
   <%
   session.invalidate();
   %>
   <script>
   location.href = 'mainPage/main.jsp';
   </script>
</body>
</html>