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
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	background-color: #f5f6f7;
}

.roomNum {
	text-align: center;
	font-family: "Comic Sans", "Apple Chancery", cursive;
	font-size: 18px;
}

.btn btn-outline-primary {
	width: 150px;
	display: inline-block;
	position: relative;
}

.roomImg {
	vertical-align: bottom;
	position: relative;
}
.wrap{
margin-left: 220px;

}
</style>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body style="background-color: #f5f5f7;">
	<%@ include file="/header.jsp"%>
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
					<img src="./img/room1.jpg" alt="room1" width="400" height="400">
					<div class="carousel-caption">
						<h3>2인실</h3>
						<p>2인실입니다. 최대 4명</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="./img/room2.jpg" alt="room2" width="400" height="400">
					<div class="carousel-caption">
						<h3>4인실</h3>
						<p>4인실입니다. 최대 6명</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="./img/room3.jpg" alt="room3" width="400" height="400">
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
	<div>

		<p
			style="font-size: 20px; font-weight: bold; text-align: center; font-family: Comic Sans, Apple Chancery, cursive;">유키
			스터디 룸 카페</p>
	</div>
	<div class="wrap">
		<div class="container-fluid"
			style="text-align: center; width: 1500px;">
			<form action="revJjin.jsp">
				<div style="width: 600px; height: 500px; float: left;">
					<p class="roomNum">1번방</p>
					<br> <img class="roomImg" src="./img/room1.jpg"
						style="width: 300px; height: 300px;"><br> <br>
					<button type="submit" class="btn btn-outline-primary" value="1">1번방예약</button>
				</div>
				<div style="width: 600px; height: 500px; float: left;">
					<p class="roomNum">2번방</p>
					<br> <img class="roomImg" src="./img/room1.jpg"
						style="width: 300px; height: 300px;"><br> <br>
					<button type="submit" class="btn btn-outline-primary" value="2">2번방예약</button>
				</div>
			</form>
		</div>
		<br>

		<div class="container-fluid"
			style="text-align: center; width: 1500px;">
			<form action="revJjin.jsp">
				<div style="width: 600px; height: 500px; float: left;">
					<p class="roomNum">3번방</p>
					<br> <img class="roomImg" src="./img/room2.jpg"
						style="width: 300px; height: 300px;"><br> <br>
					<button type="submit" class="btn btn-outline-primary" value="3">3번방예약</button>
				</div>
				<div style="width: 600px; height: 500px; float: left;">
					<p class="roomNum">4번방</p>
					<br> <img class="roomImg" src="./img/room2.jpg"
						style="width: 300px; height: 300px;"><br> <br>
					<button type="submit" class="btn btn-outline-primary" value="4">4번방예약</button>
				</div>
			</form>
		</div>
		<div class="container-fluid"
			style="text-align: center; width: 1500px;">
			<form action="revJjin.jsp">
				<div style="width: 600px; height: 500px; float: left;">
					<p class="roomNum">5번방</p>
					<br> <img class="roomImg" src="./img/room3.jpg"
						style="width: 300px; height: 300px;"><br> <br>
					<button type="submit" class="btn btn-outline-primary" value="5">5번방예약</button>
				</div>
				<div style="width: 600px; height: 500px; float: left;">
					<p class="roomNum">6번방</p>
					<br> <img class="roomImg" src="./img/room3.jpg"
						style="width: 300px; height: 300px;"><br> <br>
					<button type="submit" class="btn btn-outline-primary" value="6">6번방예약</button>
				</div>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<jsp:include page="footer.jsp" flush="true" />



</body>

</html>