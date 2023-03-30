<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src='js/jquery.js'></script>

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
<style>
div.col-m-6{
  
}
</style>
</head>
<body>
	
		<form method="post">
			<jsp:include page="../header.jsp" flush="true" />

				<div class="main">
					<!--화면양쪽에 여백부여-->
					<div>
						<br>
						<h1 style="text-align:center;">유키 스터디룸 카페</h1>
						<br>
						<section class="main_img">
							<img src="../img/스터디룸이미지1.jpg" alt="메인이미지"
								style="width: 100%; height: 500px;">
						</section>
						<section class="top"></section>
					    </div>
					     <br>
	
					<hr style="border-width: thin; border-color: #495264;">
					<br>
			
					<!--헤더밑 경계선-->
						<!--공지작성영역-->
						
						<div class="container-fluid">
                        <h3>*공지사항*</h3>
                        <div class="row">
                          <div class="col-sm-6" style="width:400px; height:280px; padding-right:0 auto;" >
                           <img alt="대나무숲" src="../img/대나무속 햇볕.jpg"
                           style="width:400px; height:280px;">
                           </div>            
                        <div class="col-sm-6" style="height: 280px; width:600px; padding-left:0 auto;">
                        <hr style="border-top: 2px ridge skyblue;">
                        <h4 style="text-align: center;">*공지사항*</h4>
                        <p>1.팀장의 말을 잘 듣자</p>
                        <p>2.컨디션 잘 챙기자</p>
                        <p>3.개발자들이 머리에서 아픈 건 자연스러운 현상이다.</p>
                        <p>4.열심히 하자</p><br>
                        <hr style="border-top: 2px ridge skyblue;">
                        </div>
                        </div><!-- row의 div -->
                        </div><!-- fluid의 div -->
                         <br>
                       <!-- 영역구분선 -->  
                         <br>
                         <div class="container-fluid">
                        <h3>*스터디룸 예약*</h3>
                        <div class="row">
                        <div class="col-sm-6" style="width:400px; height:280px; padding-right:0 auto;">
                           <img alt="스터디룸배경" src="../img/스터디룸이미지2.jpg"
                           style="width: 400px; height:280px;">
                        </div>          
                        <div class="col-sm-6" style="width:400px; height:280px; padding-left:0 auto;">
                        <hr style="border-top: 2px ridge skyblue;">
                        <h4 style="text-align:center;">*스터디룸 예약방법*</h4>
                        <p>1.회원가입 및 로그인을 한다.</p>
                        <p>2.상단에 예약페이지를 Click!</p>
                        <p>3.예약룸과 예약시간을 선택!</p>
                        <p>4.예약후 마이페이지에서 예약상태 확인까지~!</p>
                        <br>
                        <hr style="border-top: 2px ridge skyblue;">
                        </div>
                        </div>
                        </div>
                         <br>
                         <!-- 영역구분선 -->
                         <br>
                         <div class="container-fluid">
                        <h3>*공간소개 및 주변정보*</h3>
                        <div class="row"> 
                          <div class="col-sm-6" style="width:400px; height:280px; padding-right:0 auto;">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3169.5564818596504!2d126.91905655129982!3d37.400319779730275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b60d1b8dde3f9%3A0xddc103e417d54cdc!2z7ZWY7J2066-465SU7Ja07Lu07ZOo7YSw7ZWZ7JuQIOyViOyWkey6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1679972863832!5m2!1sko!2skr" 
                            width="400px" height="280px" allowfullscreen="false" style="border:0;"
                            loading="lazy" referrerpolicy="no-referrer-when-downgrade">   
                           </iframe>
                           </div>
                           <br>            
                        <div class="col-sm-6" style="width:400px; height:280px; padding-left: auto;">
                        <hr style="border-top: 2px ridge skyblue;">
                        <h4 style="text-align:center">*주변 교통정보*</h4>
                        <p>1.가까운 전철역: 안양역</p>
                        <p>2.가까운 버스정류장: 안양1번가 또는 중앙시장(맞은편) 하차</p>
                        <p>3.주변 주차장이용</p>
                        <p>&nbsp;&nbsp;&nbsp;자세한 정보는 공개소개및 위치 페이지에서 확인해주세요~</p><br>
                         <hr style="border-top: 2px ridge skyblue;">
                        </div>
                        </div><!-- row의 div -->
                        </div><!-- fluid의 div -->
                         <br>
                                       
				</div>
			</form>
				
		<div style="width: 100%; height: 100px;"></div>
		<!--본문과 footer를 나누기위한 div-->
	
	<jsp:include page="../footer.jsp" flush="true"/>
	</body>
</html>
