<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 페이지2</title>
<link rel="stylesheet" href="./main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body style="background-color: blanchedalmond;">
	<div id="mainpage">
		<header>
			<div id="logo">
				<!--이미지로고 추가할시 사용-->
				<img src="" alt="">
			</div>
			<!--로고 div영역끝-->
			<div id="login">
				<!--로그인 부분-->
				<a href="#">LOGIN</a>
			</div>
			<!--로그인 div영역끝-->

			<nav>
				<!--메뉴바 목록들-->
				<ul class="menubar">
					<li><a href="#">HOME</a></li>
					<li><a href="#" onclick="location.href='info.html'">공지</a></li>
					<li><a href="#" onclick="location.href='showcase.html'">공간소개
							및 오시는 길</a></li>
					<li><a href="#" onclick="location.href='firstRev.jsp'">스터디룸
							예약</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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

	<footer class="footer">
		<br>
		<p>현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
		<p>카피라이터: 1조 평균나이 96년생</p>
		<p>팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
	</footer>




</body>

</html>