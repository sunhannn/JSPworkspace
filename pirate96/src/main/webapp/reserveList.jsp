<!--<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="vo.ReserveVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 보기</title>
<link rel="stylesheet" href="revGo.css">
<style>
	#reserveListArea{
		width : 400px;
		border : 2px solid gray;
		margin : auto;
	}
	table{
		width : 380px;
		margin : auto;
		text-align: center;
	}
	td{
	border-bottom : 2px solid gray;
	
	
	
	}
</style>
</head>
<body>
<section id = "reserveListArea">
<table>
	<tr>
		<td colspan=2><h1>예약 목록</h1></td>
	</tr>
	<c:forEach var = "reserve" items = "${reserveList}">
	
	<tr>
		<td>
			<a href="revSel.go?num=${reserve.getR_NUM()}">
			(${reserve.getR_NUM()})	${reserve.getR_ID()}
			</a>

		</td>
		<td>
		<form action="revUp.go">
		<button type="submit" value="${reserve.getR_NUM()}" name="num">수정</button>
		</form>
		</td>
		
		<td>
		<a href="revDel.go?num=${reserve.getR_NUM()}">삭제</a>
		</td>
	</tr>
	
	</c:forEach>
</table>
</section>

</body>
</html>