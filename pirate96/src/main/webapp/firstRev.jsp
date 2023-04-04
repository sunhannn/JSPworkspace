<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 페이지1</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
body{
background-color:#f5f6f7;
}

.content_all{
width:70%;
margin: 0 auto;
}

.reserve_title{
font-size:36px;
font-weight:bold;
color: #4682b4;
margin: 30px 0;
}

.content_sub{
font-size:28px;
font-weight:bold;
color: #e15e5e;
margin: 30px 0;

}
#rev {
	width: 100%;
	height: 100%;
	color: white;
	border: 0px;
	background-color: rgb(64, 111, 134);
}

.sub_text{
font-weight: bold;
font-size: 14px;
margin-top: 10px;
}

.lift_text{
margin-top:50px;
padding: 40px;
background-color:#728c99;
}

.lift_text li {
	color: white;
	font-weight: bold;
	font-size: 15px;
}


.revBtn {
	display: block;
	text-align: center;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body>
	<%@ include file="/header.jsp"%>
<div class="content_all">
	<!-- 예약 칸 -->
	<div class="container-fluid">
		<p class="reserve_title">스터디룸 예약</p>
		<hr>
	</div>
	<br>
	<div class="container-fluid">

		<p class="content_sub">홈페이지 예약제(전화예약 불가)</p>
		<p class="content_sub">주말, 공휴일 OPEN</p>
	</div>
	<br>
	<br>
	<!-- 예약 버튼 -->
		<p style="font-size: 14px;">▼ 아래버튼을 클릭하시면 예약페이지로 이동할 수 있습니다.</p>
		<form action="revPage.jsp" id="frm">
			<div class="rev__btn" style="height: 90px; text-align: center;">
			
  <c:choose>
  <c:when test="${ null eq id }">
  <button type="button" onclick="location.href='loginForm.jsp'" id="rev">스터디룸 예약하러 가기 ▶</button>	
  </c:when>
  <c:otherwise>
  <button type="button" onclick="btn()" id="rev">스터디룸 예약하러 가기 ▶</button>
  </c:otherwise>
  </c:choose>
			
			
	
				
			</div>
		</form>
		<p class="sub_text">예약 후 별도 절차없이 예약시간 현장 방문하여 이용하시면 됩니다.</p>
	<!-- 예약시 주의사항 리스트 -->
	
		<ul class="lift_text">
			<li>"공부하고 배우는 것은 평생이며, 그러한 것을 거부하는 것은 늙음과 같습니다." - 리챌라이트</li>
			<li>"누구든지 처음에는 아무 것도 몰랐다. 그들이 성공한 이유는, 그들이 항상 배우고 성장하며 계속 노력했기
				때문이다." - 존 C. 맥스웰</li>
		</ul>
</div>
   <div class="footer">
<%@ include file="/footer.jsp" %>
	</div>

	<script>
		function btn() {
			document.getElementById('frm').submit();
		}
	</script>

</body>

</html>