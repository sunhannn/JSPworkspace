<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>방별로 예약하기</title>
<link rel="stylesheet" href="./main.css">
</link>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #f5f6f7;
}
</style>




<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<%
int upNum = Integer.parseInt(request.getParameter("r_num"));
%>

<body>
	<jsp:include page="header.jsp" flush="true" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid">
		<h3 style="text-align: center; color: #4682b4;">예약 정보 수정</h3>
		<br>
		<hr>
		<p
			style="font-size: 18px; font-weight: bold; text-align: center; color: crimson;">다음
			주의사항을 꼭 지켜주세요!</p>
	</div>
	<div class="container-fluid"
		style="text-align: center; width: 500px; height: 300px; border: 2px solid lime; text-decoration: underline;">
		<br> <br>
		<p>♣ 취식물은 마실 것만 가능합니다.</p>
		<br>
		<p>♣ 다음 사람을 위해 정리하고 나가주세요.</p>
		<br>
		<p>♣ 예약 시간을 준수해주세요.</p>
		<br>
		<p>♣ 예약은 1시간 단위로 가능합니다.</p>
		<br>

	</div>
	<hr>
	<br>

	<div class="container-fluid" style="text-align: center;">
		<form action="relUpAction.go" id="rev" onsubmit="time()">
			<div class="date">
				<p style="font-size: 15px; font-weight: bold;">예약 일자</p>
				<input type="date" name="R_DATE" id="currentDate" value="today"
					style="width: 150px; text-align: center;">
			</div>
			<br>
			<div class="start">
				<p style="font-size: 15px; font-weight: bold;">시작 시간</p>
				<%
				String r_stime = request.getParameter("r_stime"); 
				String r_etime = request.getParameter("r_etime");
				String r_room =request.getParameter("r_room");
				%>
				<select name="R_STIME" id="startTime"
					style="width: 150px; text-align: center;">
					<option value="1" <%="1".equals(r_stime)?"selected":"" %>>01:00</option>
                        <option value="2" <%="2".equals(r_stime)?"selected":"" %>>02:00</option>
                        <option value="3" <%="3".equals(r_stime)?"selected":"" %>>03:00</option>
                        <option value="4" <%="4".equals(r_stime)?"selected":"" %>>04:00</option>
                        <option value="5" <%="5".equals(r_stime)?"selected":"" %>>05:00</option>
                        <option value="6" <%="6".equals(r_stime)?"selected":"" %>>06:00</option>
                        <option value="7" <%="7".equals(r_stime)?"selected":"" %>>07:00</option>
                        <option value="8" <%="8".equals(r_stime)?"selected":"" %>>08:00</option>
                        <option value="9" <%="9".equals(r_stime)?"selected":"" %>>09:00</option>
                        <option value="10" <%="10".equals(r_stime)?"selected":"" %>>10:00</option>
                        <option value="11" <%="11".equals(r_stime)?"selected":"" %>>11:00</option>
                        <option value="12" <%="12".equals(r_stime)?"selected":"" %>>12:00</option>
                        <option value="13" <%="13".equals(r_stime)?"selected":"" %>>13:00</option>
                        <option value="14" <%="14".equals(r_stime)?"selected":"" %>>14:00</option>
                        <option value="15" <%="15".equals(r_stime)?"selected":"" %>>15:00</option>
                        <option value="16" <%="16".equals(r_stime)?"selected":"" %>>16:00</option>
                        <option value="17" <%="17".equals(r_stime)?"selected":"" %>>17:00</option>
                        <option value="18" <%="18".equals(r_stime)?"selected":"" %>>18:00</option>
                        <option value="19" <%="19".equals(r_stime)?"selected":"" %>>19:00</option>
                        <option value="20" <%="20".equals(r_stime)?"selected":"" %>>20:00</option>
                        <option value="21" <%="21".equals(r_stime)?"selected":"" %>>21:00</option>
                        <option value="22" <%="22".equals(r_stime)?"selected":"" %>>22:00</option>
                        <option value="23" <%="23".equals(r_stime)?"selected":"" %>>23:00</option>
                        <option value="24" <%="24".equals(r_stime)?"selected":"" %>>24:00</option>
				</select>
			</div>
			<br>
			<div>
				<p style="font-size: 15px; font-weight: bold;">종료 시간</p>
				<select name="R_ETIME" id="endTime"
					style="width: 150px; text-align: center;">
						<option value="1" <%="1".equals(r_etime)?"selected":"" %>>01:00</option>
                        <option value="2" <%="2".equals(r_etime)?"selected":"" %>>02:00</option>
                        <option value="3" <%="3".equals(r_etime)?"selected":"" %>>03:00</option>
                        <option value="4" <%="4".equals(r_etime)?"selected":"" %>>04:00</option>
                        <option value="5" <%="5".equals(r_etime)?"selected":"" %>>05:00</option>
                        <option value="6" <%="6".equals(r_etime)?"selected":"" %>>06:00</option>
                        <option value="7" <%="7".equals(r_etime)?"selected":"" %>>07:00</option>
                        <option value="8" <%="8".equals(r_etime)?"selected":"" %>>08:00</option>
                        <option value="9" <%="9".equals(r_etime)?"selected":"" %>>09:00</option>
                        <option value="10" <%="10".equals(r_etime)?"selected":"" %>>10:00</option>
                        <option value="11" <%="11".equals(r_etime)?"selected":"" %>>11:00</option>
                        <option value="12" <%="12".equals(r_etime)?"selected":"" %>>12:00</option>
                        <option value="13" <%="13".equals(r_etime)?"selected":"" %>>13:00</option>
                        <option value="14" <%="14".equals(r_etime)?"selected":"" %>>14:00</option>
                        <option value="15" <%="15".equals(r_etime)?"selected":"" %>>15:00</option>
                        <option value="16" <%="16".equals(r_etime)?"selected":"" %>>16:00</option>
                        <option value="17" <%="17".equals(r_etime)?"selected":"" %>>17:00</option>
                        <option value="18" <%="18".equals(r_etime)?"selected":"" %>>18:00</option>
                        <option value="19" <%="19".equals(r_etime)?"selected":"" %>>19:00</option>
                        <option value="20" <%="20".equals(r_etime)?"selected":"" %>>20:00</option>
                        <option value="21" <%="21".equals(r_etime)?"selected":"" %>>21:00</option>
                        <option value="22" <%="22".equals(r_etime)?"selected":"" %>>22:00</option>
                        <option value="23" <%="23".equals(r_etime)?"selected":"" %>>23:00</option>
                        <option value="24" <%="24".equals(r_etime)?"selected":"" %>>24:00</option>
				</select>



			</div>
			<br>
			<div>
				<p style="font-size: 15px; font-weight: bold;">원하시는 방 번호를 골라주세요.</p>
				<select name="R_ROOM" id="roomNum"
					style="width: 150px; text-align: center;">
                      <option value="1" <%="1".equals(r_room)?"selected":"" %> >1번방</option>
                      <option value="2" <%="2".equals(r_room)?"selected":"" %> >2번방</option>
                      <option value="3" <%="3".equals(r_room)?"selected":"" %>>3번방</option>
                      <option value="4" <%="4".equals(r_room)?"selected":"" %>>4번방</option>
                      <option value="5" <%="5".equals(r_room)?"selected":"" %>>5번방</option>
                      <option value="6" <%="6".equals(r_room)?"selected":"" %>>6번방</option>
				</select>


			</div>
			<br> <br>

			<button type="submit" class="btn btn-outline-primary"
				value="<%=upNum%>" name="r_num">수정하기</button>
			<hr>
		</form>
	</div>
	<!-- 디폴트 오늘날짜 JS -->
	<script>
		document.getElementById('currentDate').value = new Date().toISOString()
				.substring(0, 10);

		function time() {
			var start = document.getElementById('startTime').value;
			var end = document.getElementById('endTime').value;

			if (start > end) {
				alert('시작시간을 종료 시간보다 빠르게 설정해주세요!');
				history.back();
				event.preventDefault();
			} else if (start == end) {
				alert('시작시간을 종료 시간보다 빠르게 설정해주세요!');
				history.back();
				event.preventDefault();

			}
		}
	</script>
	<jsp:include page="footer.jsp" flush="true" />
</body>

</html>