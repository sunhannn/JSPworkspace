<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src='js/jquery.js'></script>
<!--외부 스타일시트 적용-->

<script>
	const loginButton = document.querySelector('.login');

	loginButton.addEventListener('click', function() {
		if (loginButton.classList.contains('logged-in')) {
			loginButton.classList.remove('logged-in');
		} else {
			loginButton.classList.add('logged-in');
		}
	});
	alert("로그인하셔야합니다.");
</script>
</head>
<body>
	<div class="wrapper">
		<form method="post">
			<jsp:include page="../header.jsp" flush="true" />

			<div class="container">

				<div class="main">
					<!--화면양쪽에 여백부여-->
					<div>
						<br> <br> <br>
						<section class="main_img">
							<img src="../img/스터디룸이미지1.jpg" alt="메인이미지"
								style="width: 100%; height: 500px;">
						</section>
						<section class="top"></section>
					</div>
					<br> <br>

					<hr style="border-width: thin; border-color: rgb(110, 178, 238);">
					<br> <br>
					<!--헤더밑 경계선-->
					<div class="menu">
						<!--공지작성영역-->
						<div
							style="width: 350px; height: 300px; float: left; margin-right: 30px;">
							<h3>*공지사항*</h3>
							<img src="img/대나무속 햇볕.jpg" alt="대나무숲"
								style="width: 340px; height: 280px;">
						</div>
						<div style="width: auto; height: auto;"></div>
						<br> <br>
						<div
							style="width: 400px; height: 250px; float: left; border-top: 2px ridge navy; border-bottom: 2px ridge navy;">
							<h4 style="text-align: center;">
								<a>*공지사항*</a>
							</h4>
							<p>심심</p>

						</div>
					</div>
					<div style="clear: both;"></div>
					<!--영역아래의 div가 따라올라가는 것을 방지-->

					<hr style="border: 2px solid skyblue">
					<br> <br>
					<!--예약방법 작성영역-->
					<div class="menu">
						<div
							style="width: 400px; height: 300px; float: left; margin: auto;">
							<h3>*스터디룸 예약*</h3>
							<img src="../img/스터디룸이미지2.jpg" alt="예약이미지"
								style="width: 340px; height: 280px;">
						</div>
						<div style="width: auto; height: auto;"></div>
						<br> <br>
						<div
							style="width: 400px; height: 250px; float: left; border-top: 2px ridge navy; border-bottom: 2px ridge navy;">
							<h4 style="text-align: center;">
								<a>*스터디룸예약*</a>
							</h4>
							<p>방법1</p>
							<p>방법2</p>
							<p>방법3</p>
						</div>
					</div>
					<div style="clear: both;"></div>
					<!--영역아래의 div가 따라올라가는 것을 방지-->

					<hr style="border: 2px solid skyblue">
					<br> <br>
					<div class="menu">
						<div
							style="width: 350px; height: 300px; float: left; margin-right: 30px;">
							<br>
							<!--구글지도- 위치변경시 src에 지도소스넣으면됨 -->
							<h3>*공간소개 및 오시는 길*</h3>
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6339.176514240069!2d126.92403290000001!3d37.3995685!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b619d64bd63cd%3A0x53b7daa94a950172!2z656t7Iqk7YSw65SU7Lm07Y6YIOyViOyWkeyXreygkA!5e0!3m2!1sko!2skr!4v1679272950532!5m2!1sko!2skr"
								style="border: 0; width: 350px; height: 350px;"
								allowfullscreen="false" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"> </iframe>
						</div>
						<div style="width: auto; height: auto;"></div>
						<br> <br> <br>
						<div
							style="width: 400px; height: 250px; float: left; border-top: 2px ridge navy; border-bottom: 2px ridge navy;">
							<h4 style="text-align: center;">
								<a>*주변 교통정보*</a>
							</h4>
							<p>1.장소에 대한 주변대중교통이용방법 설명칸입니다.</p>
							<p>2.주변에 근접한 버스정류장</p>
							<p>3.주변에 근접한 전철역</p>
						</div>
					</div>
					<div style="clear: both;"></div>
					<!--영역아래의 div가 따라올라가는 것을 방지-->
				</div>
			</div>
			<!--div의 container클래스 끝위치-->

			<div class="sidemenu">
				<ul>
					<li><a href="#" onclick="location.href='info.html'">공지</a></li>
					<li><a href="#" onclick="location.href='location.html'">위치</a></li>
					<li><a href="#" onclick="location.href='reserve.html'">방예약</a></li>
					<li><a href="#" onclick="selection.top">top</a></li>
				</ul>
			</div>
		</form>
		<div style="width: 100%; height: 200px;"></div>
		<!--본문과 footer를 나누기위한 div-->
	</div>
	<!--wrapper의 끝위치-->
	<jsp:include page="../footer.jsp" flush="true"/></body>
</html>
