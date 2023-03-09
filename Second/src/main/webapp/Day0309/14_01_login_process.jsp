<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("passwd");

if (id != null && id.equals("") && pw != null && pw.equals("")) {
	session.setAttribute("userID", id);

}

response.sendRedirect("14_01_loginmenu.jsp");
%>