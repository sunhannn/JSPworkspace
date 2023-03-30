<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<style>

/* 전체페이지 */
.content_all {
	width: 95%;
	margin: 0 auto;
}

.title {
	font-size: 28px;
	font-weight: bold;
	width: 80%;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 20px;
}

/* 마이페이지밑 hr */
hr {
	height: 3px;
	background: #000;
	border: 0;
	width: 80%;
}

.text_zone {
	width: 90%;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 100px;
}
/* 테이블 */
table {
	margin: auto;
	text-align: center;
	border: none;
	height: 600px;
}

tr, td {
	margin: auto;
	border: none;
	width: 400px;
}
/* 내정보확인 */
.chkinfo {
	padding: 45px 35px;
}
/* 예약목록확인 */
.revlist {
	padding: 45px 28px;
}
/* 메인으로가기 */
.main {
	padding: 45px 43px;
}
/* 회원탈퇴 */
.deleteinfo {
	padding: 45px 28px;
}
/* 로그아웃 */
.logout {
	padding: 45px 28px;
}
/* 개인정보변경 */
.updateinfo {
	padding: 45px 28px;
}
/* 버튼 */
button {
	border: none;
	border-radius: 50%;
	background-color: #aacef2;
	border: 1px solid lightgray;
	font-weight: bolder;
	color: #7796b5;
	font-size: 13px;
}
/* submit */
input {
	border: none;
	border-radius: 50%;
	background-color: #aacef2;
	border: 1px solid lightgra;
	color: #7796b5;
	font-size: 13px;
	font-weight: bolder;
}
/* 버튼 호버시 */
button:hover {
	background-color: #75b2f0;
	color: white;
	border: 2px solid white;
	cursor: pointer;
}

/* submit 호버시 */
input:hover {
	background-color: #75b2f0;
	color: white;
	border: 2px solid white;
	cursor: pointer;
}

.welcome {
	margin-left: 100px;
}
</style>
</head>

<body>
	<!-- 마이페이지 -->
	<div class="content_all">
		<p class="title">마이페이지</p>
		<hr>
		<div class="text_zone">
			<div class="welcome">
				<%
				Enumeration enumeration = session.getAttributeNames();
				int i = 0;
				while (enumeration.hasMoreElements()) {
					i++;

					String sName = enumeration.nextElement().toString();
					String sValue = (String) session.getAttribute(sName);

					if (sValue != null) {
						out.println(sValue + "님, 안녕하세요<br/>");
					} else {
						out.println("일치하는 데이터가 존재하지 않습니다.");
					}
				}
				%>
			</div>
		</div>

		<table>
			<tr>
				<td><form action="./myinfo.go">
						<button type="submit" class="chkinfo">내정보</button>

					</form></td>
				<td><form action="updatepage.jsp">
						<input type="submit" value="정보변경" class="updateinfo">
					</form></td>
				<td><form action="memberDeleteAction.go">
						<input type="submit" value="회원탈퇴" class="deleteinfo">
					</form></td>
			</tr>
			<tr>
				<td><form action="memberLogout.go" class="logout">
						<input type="submit" value="로그아웃" class="logout">

					</form></td>
				<td><form action="revList.go" class="chkrevlist">
						<button type="submit" class="revlist">예약목록</button>
					</form></td>
				<td><form action="mainPage/main.jsp" class="gomain">
						<button type="submit" class="main">메인</button>
					</form></td>
			</tr>

		</table>

	</div>


	<!-- </div>  -->


</body>
</html>