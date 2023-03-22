<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 보기</title>
<style>
	#reserveInfoArea{
		width :500px;
		margin : auto;
		border : 1px solid gray;
	}
	table{
		width : 480px;
		margin : auto;
		text-align: center;
	}
	td{
	border-bottom : 2px solid gray;
	
	}
</style>
</head>
<body>

<div style="text-align: center;">
<h1>예약 상세 보기</h1>



</div>


<section id = "reserveInfoArea">
<table>
	<tr>
		<td>아이디 : </td>
		<td>${reserve.getR_ID() }</td>
	</tr>
	<tr>
		<td>예약자 이름 : </td>
		<td>${reserve.getR_NAME()}</td>
	</tr>
	<tr>
		<td>예약자 핸드폰 번호 : </td>
		<td>${reserve.getR_PH()}</td>
	</tr>
	<tr>
		<td>예약 시간 :  </td>
		<td>${reserve.getR_DATE()}, ${reserve.getR_STIME()}시 부터 ${reserve.getR_ETIME()}시까지입니다. </td>
	</tr>
	<tr>
		<td>결제 금액 : </td>
		<td>${reserve.getR_PRI()}</td>
	</tr>
	<tr>
		<td>방번호 : </td>
		<td>${reserve.getR_ROOM()}번방</td>
	</tr>
	<tr>
		<td colspan=2>
			<a href="revList.go">리스트로 돌아가기</a>
		</td>
	</tr>
</table>
</section>
</body>
</html>