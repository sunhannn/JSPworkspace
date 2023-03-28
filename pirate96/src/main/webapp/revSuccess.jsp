<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 완료</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f5f6f7;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp" flush="true" />
	<br>
	<br>
	<div style="text-align: center;">
		<h3 style="color: brown;">★ 예약이 완료되었습니다.</h3>
		<hr>
		<br>
		<p
			style="font-weight: bold; text-decoration: underline; color: red; font-size: 18px;">가능하면
			예약 시간까지 도착해주세요!</p>

	</div>
	<br>
	<br>
	<br>
	<br>
	<div>
		<form action="main.jsp">
			<button type="submit" class="btn btn-primary btn-block">메인화면으로
				돌아가기</button>

		</form>

	</div>
	<br>
	<br>
	<div>
		<form action="revJjin.jsp">
			<button type="submit" class="btn btn-primary btn-block">추가
				예약하기</button>
		</form>

	</div>
	<br>
	<br>
	<div>
		<form action="revList.go">
			<button type="submit" class="btn btn-primary btn-block">예약
				목록 보기</button>



		</form>


	</div>

	<jsp:include page="footer.jsp" flush="true" />



</body>

</html>