<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 페이지1</title>
<link rel="stylesheet" href="revGo.css">
<link rel="stylesheet" href="../jq/js/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../jq/js/jquery-ui.js"></script>


</head>

<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="#">Logo</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">Link 1</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link 2</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link 3</a></li>
		</ul>
	</nav>
	<br>
	<br>
	<br>

	<!-- 예약 칸 -->
	<div class="container-fluid">
		<h2 style="color: brown;">스터디룸 예약</h2>
		<hr>
	</div>
	<br>
	<div class="container-fluid">

		<h2 style="font-weight: bold; color: chocolate;">홈페이지 예약제(전화예약
			불가)</h2>
		<br>
		<br>
		<hr>
	</div>
	<br>
	<br>
	<!-- 예약 버튼 -->
	<div class="container-fluid">
		<p style="font-size: 14px;">▼ 아래버튼을 클릭하시면 예약페이지로 이동할 수 있습니다.</p>
		<form action="revPage.jsp" id="frm">
			<div class="rev__btn" style="height: 90px; text-align: center;">
				<button onclick="btn()" id="rev">스터디룸 예약하러 가기 ▶</button>
			</div>
		</form>
	</div>
	<br>
	<!-- 예약시 주의사항 리스트 -->
	<div class="container-fluid">
		<ul>
			<li>지금부터 3시간 이후부터 예약이 가능합니다.</li>
			<li>예약 후 별도 절차없이 예약시간 현장 방문하여 이용하시면 됩니다.</li>
			<li>최대 4시간 예약이 가능합니다.</li>
		</ul>

	</div>
	<script>
		window.onload = function() {
			document.getElementById('btn').onclick = function() {
				document.getElementById('frm').submit();
				return false;
			};
		};
	</script>

</body>

</html>