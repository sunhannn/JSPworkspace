<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title></title>
<script src='js/jquery.js'></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

.main { /*화면양쪽에 여백부여*/
	margin-left: 100px;
	margin-right: 100px;
}

.wrapper {
	height: 100px;
	background-color: #f5f6f7;
	padding-top: 0;
	min-height: 100px;
	position: relative;
	margin: 0;
}

.container {
    width: 1300px;
	align-items: center;
	justify-content: center;
}
@media (min-width: 1200px){
.container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 1300px;
}
}
header { /*header 영역*/
	position: fixed;
	width: 100%; /*메인이미지의 너비사이즈와 같음*/
	height: 100px;
	background-color: #495264;
	z-index: 999;
	/*헤더안에 요소들을 모두 absolute포지션으로 배치하기위한
    헤더의 좌상단을 기준으로 해주려면 
    헤더의 position이 relative여야 함*/
	/* position: relative;*/
}
/*메인페이지의 로고 이미지위치 지정*/
#logo {
	position: fixed;
	top: 30px;
	left: 30px;
}

/*제목영역안에 오른쪽 상단에 menubar배치*/
#menubar {
	position: fixed;
	top: 20px;
	right: 10px;
	text-align: center;
	color: white;
}

#menubar nav div li {
	position: fixed;
	/*position: absolute;*/
	float: right;
	font-size: 16px
}

.login a:hover {
	color: red;
	font-size: 20px;
}

/*menubar a의 글씨색설정*/
#menubar a {
	color: white;
}

/* 헤더영역에 네비게이션 메뉴 배치*/
nav ul {
	margin: auto;
	position: absolute;
	bottom: 10px;
	left: 220px;
	font-size: 16px;
}

nav ul a:hover {
	color: red;
}

nav li {
	text-align: auto;
	display: inline-block;
	margin: 30px;
}

nav li a {
	color: white;
}

ul {
	list-style: none; /*리스트 앞에 . 같은 것을 제거*/
	text-align: auto;
}

a {
	text-decoration: none; /*링크에 밑줄제거*/
}
/*전체 페이지가 가운데로 오도록 설정*/
#page {
	width: 820px;
	margin: 0px auto;
}
</style>
<script></script>
	<form method="post">
	
		<div id="mainpage">
			<header>
				<div id="logo">
					<!--이미지로고 추가할시 사용-->
					<img src="" alt="">
				</div>
				<!--로고 div영역끝-->
				<div>
					<nav>
						<!--메뉴바 목록들-->
						<ul class="menubar">
							<li><a href="#"
								onclick="location.href='../mainPage/main.jsp'">HOME</a></li>
							<li><a href="#" onclick="location.href='../boardGo.go'">공지</a></li>
							<li><a href="#" onclick="location.href='QnA.html'">QnA</a></li>
							<li><a href="#" onclick="location.href='location.html'">공간소개
									및 오시는 길</a></li>
							<li><a href="#" onclick="location.href='../firstRev.jsp'">스터디룸
									예약</a></li>
						</ul>


						<div style="float: right; margin:40px;">
							<c:if test="${ 'admin' eq id }">
								<button type="button" onclick="location.href='../logout.jsp'">로그아웃</button>
								<button type="button" onclick="location.href='../admin.jsp'">관리자페이지</button>
							</c:if>

							<c:if test="${ id == null}">
								<a href="../loginForm.jsp">LOGIN</a>
							</c:if>

							<c:if test="${ id != null and id != 'admin'}">
								<button type="button" onclick="location.href='../logout.jsp'">로그아웃</button>
								<button type="button" onclick="location.href='../mypage.jsp'">마이페이지</button>
							</c:if>
						</div>
					</nav>
				</div>
			</header>
			<div>
			<br>
		    <h1 style="text-align:center;">하이미디어 스터디룸카페</h1>
		    <br>
			</div>
		</div>
		<div></div>
		<!--div의 container클래스 끝위치-->

	</form>


</head>
</body>
</html>