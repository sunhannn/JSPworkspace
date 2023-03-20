<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 페이지2</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body style="background-color: blanchedalmond;">
	<!-- 네비게이션 바 -->
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
	<!-- 사진 넘기기 -->
	<div class="container-fluid" style="text-align: center;">
		<div id="demo" class="carousel slide" data-ride="carousel">
			<!-- <div id="demo" class="carousel slide"> -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="./img/room1.jpg" alt="room1" width="500" height="500">
					<div class="carousel-caption">
						<h3>2인실</h3>
						<p>2인실입니다. 최대 4명</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="./img/room2.jpg" alt="room2" width="500" height="500">
					<div class="carousel-caption">
						<h3>4인실</h3>
						<p>4인실입니다. 최대 6명</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="./img/room3.jpg" alt="room3" width="500" height="500">
					<div class="carousel-caption">
						<h3>10인실</h3>
						<p>10인실입니다.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>

	</div>
	<br>
	<div class="container-fluid" style="width: 500px; height: 500px;">
		<div>
			<p style="font-size: 16px; font-weight: bold;">상현 스터디 룸 카페</p>
		</div>

	</div>
	<div class="container-fluid" style="text-align: center;">
		<form action="revJjin.jsp">
			<div style="width: 700px; height: 500px; float: left;">
				<p class="roomNum">1번방</p>
				<br> <img src="./img/room1.jpg"
					style="width: 400px; height: 400px;">
				<button type="submit" class="revBtn" value="1">1번방예약</button>
			</div>
			<div style="width: 700px; height: 500px; float: left;">
				<p class="roomNum">2번방</p>
				<br> <img src="./img/room1.jpg"
					style="width: 400px; height: 400px;">
				<button type="submit" class="revBtn" value="2">2번방예약</button>
			</div>
		</form>
	</div>
	<br>

	<div class="container-fluid" style="text-align: center;">
		<form action="revJjin.jsp">
			<div style="width: 700px; height: 500px; float: left;">
				<p class="roomNum">3번방</p>
				<br> <img src="./img/room2.jpg"
					style="width: 400px; height: 400px;">
				<button type="submit" class="revBtn" value="3">3번방예약</button>
			</div>
			<div style="width: 700px; height: 500px; float: left;">
				<p class="roomNum">4번방</p>
				<br> <img src="./img/room2.jpg"
					style="width: 400px; height: 400px;">
				<button type="submit" class="revBtn" value="4">4번방예약</button>
			</div>
		</form>
	</div>
	<div class="container-fluid" style="text-align: center;">
		<form action="revJjin.jsp">
			<div style="width: 700px; height: 500px; float: left;">
				<p class="roomNum">5번방</p>
				<br> <img src="./img/room3.jpg"
					style="width: 400px; height: 400px;">
				<button type="submit" class="revBtn" value="5">5번방예약</button>
			</div>
			<div style="width: 700px; height: 500px; float: left;">
				<p class="roomNum">6번방</p>
				<br> <img src="./img/room3.jpg"
					style="width: 400px; height: 400px;">
				<button type="submit" class="revBtn" value="6">6번방예약</button>
			</div>
		</form>
	</div>






</body>

</html>