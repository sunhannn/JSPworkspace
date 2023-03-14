<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = null;
String user = "test";
String password = "1111";

String url = "jdbc:oracle:thin:@localhost:1521:xe";
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, user, password);
%>



