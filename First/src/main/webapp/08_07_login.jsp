<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%request.setCharacterEncoding("utf-8"); %> --%>
<!DOCTYPE html>
<%
String id=request.getParameter("memberId");
String pw=request.getParameter("memberPass");
if(id!=null&&id.equals("admin")&&pw!=null&&pw.equals("1234")){
	response.sendRedirect("08_06_index.jsp");
	}else{
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>