<%@page import="vo.PageInfo"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
ArrayList<MemberVO> articleList = (ArrayList<MemberVO>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>


<!-- -start- 관리자 아이디인지 세션 확인 -->
<%
String user_id = (String) session.getAttribute("userID"); // 이전 페이지에서 로그인으로 받아온 아이디
String user_pw = (String) session.getAttribute("userPW"); // 이전 페이지에서 로그인으로 받아온 비밀번호 
boolean return_main = false;

if (user_id == null || user_pw == null || !(user_id.equals("admin") || user_pw.equals("1234"))) {
	return_main = true;
}

if (return_main) {
	// 관리자 계정이 아닐 시 메인 페이지로 이동
	out.print("<script>alert('권한이 없습니다.'); location.href ='main.jsp';</script>");
}
%>
<!-- -end- 관리자 아이디인지 세션 확인 -->
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src='js/jquery.js'></script>
<!--외부 스타일시트 적용-->
<link rel="stylesheet" href="css/main.css">
<script>
	/* 예약 취소 시 경고창 */

	$(function() {
		$(".delete_btn").on("click", function() {

			if (confirm("정말 해당 회원을 삭제하시겠습니까 ?") == true) {
				alert("삭제되었습니다");
				$(this).parent().submit();
			} else {
				return;
			}
		});
	});

	/* 페이징 넘어갈 때마다 스타일 */
	$("button.paging_btn").click(function() {
		$("button.paging_btn").removeClass("select");
		$(this).addClass("select");
	});
</script>
<style>
/* 예약 표 위에 문구 */
#admin_page {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
	margin-bottom: 60px;
}

/* 리스트 문구 ~ 표까지 감싼 부분 패딩 */
section.list {
	padding-bottom: 80px;
}

/* 모든 하이퍼 a 링크에 밑줄제거*/
a {
	text-decoration: none;
}

/* 예약 취소에 포인터 설정 */
a.delete_btn:hover {
	cursor: pointer;
}

/* 테이블 */
.board-table {
	border-collapse: collapse;
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

/* 테이블 th, td에 패딩 넣기 */
.board-table th, .board-table td {
	padding: 14px 0;
}

/* ▼ 테이블 텍스트 정렬 */
.td_center {
	text-align: center;
}

.td_right {
	text-align: right;
}
/* ▲ 테이블 데이터 텍스트 정렬 */

/* 예약 수정, 삭제 a 링크 */
.board-table a:hover {
	text-decoration: underline;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	vertical-align: middle;
}

/* 내역 줄마다 구분선 */
.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

/* 페이징 처리 */
#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
	font-color: black;
}

/* 페이징 버튼 css */
.paging_btn {
	background-color: #f5f6f7;
	outline: none;
	border: 0;
	cursor: pointer;
	padding: 3px;
}

button.select {
	font-weight: bold;
	border: 1px solid #ccc;
}

/* 검색 div 가운데 정렬 */
#search_table {
	width: 75%;
	margin: auto;
}

/* 검색 셀렉트 박스 */
#search_member_select {
	padding: 15px 10px;
	border: 1px solid #999;
}

/* 검색 셀렉트 옵션 수평 정렬 */
.member_search_sub {
	text-align: left;
}

/* 검색 input 박스 */
#member_search_value {
	width: 250px;
	padding: 16px 15px;
	border: 1px solid #999;
}

/* 검색 버튼 */
#search_submit {
	border: 1px solid #999;
	vertical-align: middle;
	background-color: #999;
	color: white;
	padding: 14px 15px;
	font-size: 0.9em;
}

/* 보여줄 리스트가 없을 때 공간 */
#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>

<body>
	<div class="wrapper">

		<form method="post">
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
							<li><a href="#" onclick="location.href='reserve.html'">스터디룸
									예약</a></li>
						</ul>
					</nav>
				</header>
			</div>
		</form>
		<div class="container">
			<div class="main">
				<!--화면양쪽에 여백부여-->

				<!-- ▼ 들어갈 내용 -->
				<div class="admin_area">
					<section class="list">
						<div class="page-title">
							<p id="admin_page">회원 리스트</p>
						</div>
						<br>

						<section id="listForm">
							<table class="board-table">
								<%
								if (articleList != null && listCount > 0) {
								%>

								<tr id="tr_top">
									<th scope="col">이름</th>
									<th scope="col">ID</th>
									<th scope="col">비밀번호</th>
									<th scope="col">핸드폰 번호</th>
									<th scope="col">주소</th>
									<th scope="col">이메일</th>
									<th scope="col">성별</th>
									<th scope="col" colspan="2">관 리</th>
								</tr>

								<tbody>
									<%
									for (int i = 0; i < articleList.size(); i++) {
									%>
									<tr>
										<td class="td_center"><%=articleList.get(i).getM_NAME()%></td>
										<td class="td_center"><%=articleList.get(i).getM_ID()%></td>
										<td class="td_center"><%=articleList.get(i).getM_PW()%></td>
										<td class="td_center"><%=articleList.get(i).getM_PH()%></td>
										<td class="td_center"><%=articleList.get(i).getM_ADDR()%></td>
										<td class="td_center"><%=articleList.get(i).getM_EMAIL()%></td>
										<td class="td_center"><%=articleList.get(i).getM_GENDER()%></td>
										<td class="td_center"><a style="color: gray;"
											href="memberModify.go?m_id=<%=articleList.get(i).getM_ID()%>&page=<%=nowPage%>">
												회원 수정</a></td>
										<td class="td_center">
											<form name="delete_form" method="post"
												action="memberDelete.go?m_id=<%=articleList.get(i).getM_ID()%>">
												<a class="delete_btn" style="color: gray;">회원 삭제</a>
											</form>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</section>
					</section>

					<!-- 페이지 리스트(페이징) -->
					<section id="pageList">
						<%
						if (nowPage <= 1) {
						%>
						<button type="button" class="paging_btn">이전</button>
						<%
						} else {
						%>
						<button type="button" class="paging_btn"
							onClick="location.href='memberList.go?page=<%=nowPage - 1%>'">이전</button>
						&nbsp;
						<%
						}
						%>

						<%
						for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
						%>
						<button type="button" class="paging_btn select">
							<%=a%>
						</button>
						<%
						} else {
						%>
						<button class="paging_btn"
							onClick="location.href='memberList.go?page=<%=a%>'"><%=a%>
						</button>
						<%
						}
						%>
						<%
						}
						%>


						<%
						if (nowPage >= maxPage) {
						%>
						<button type="button" class="paging_btn">다음</button>
						<%
						} else {
						%>
						<button type="button" class="paging_btn"
							onClick="location.href='memberList.go?page=<%=nowPage + 1%>'">다음
						</button>
						<%
						}
						%>
					</section>
					<%
					} else {
					%>
					<section id="emptyArea">조회 가능한 회원이 없습니다.</section>
					<%
					}
					%>


					<br> <br>

					<!-- 예약 검색창 -->
					<form action="memberSearch.go" method="post">
						<table id="search_table">
							<tr>
								<td colspan="4" style="text-align: center; padding: 15px;"><select
									name="search" id="search_member_select">
										<!--  찾을 조건들 -->
										<option value="id" class="member_search_sub">아이디
										<option value="name" class="member_search_sub">이름
										<option value="ph" class="member_search_sub">핸드폰 번호
										<option value="addr" class="member_search_sub">주소
										<option value="email" class="member_search_sub">이메일
										<option value="gender" class="member_search_sub">성별
											<!--  찾을 조건들 -->
								</select> <input type="text" name="search_value" id="member_search_value"
									placeholder="검색할 정보를 입력해주세요." maxlength="200">
								<button id="search_submit" type="submit">검색</button></td>
							</tr>
						</table>
					</form>
				</div>
				<!-- ▲ 들어갈 내용 -->
			</div>
			<div style="clear: both;"></div>
			<!--영역아래의 div가 따라올라가는 것을 방지-->
			<!--예약방법 작성영역-->
			<div style="clear: both;"></div>
			<!--영역아래의 div가 따라올라가는 것을 방지-->
		</div>
		<!--div의 container클래스 끝위치-->
		<!-- 		<div style="width: 100%; height: 100px;"></div> -->
		<!--본문과 footer를 나누기위한 div-->
		<!--footer영역-->
		<hr style="">
		<footer class="footer">
			<br>
			<p>현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
			<p>카피라이터: 1조 평균나이 96년생</p>
			<p>팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
		</footer>
		<!--footer영역끝-->

	</div>
	<!--wrapper의 끝위치-->
</body>

</html>