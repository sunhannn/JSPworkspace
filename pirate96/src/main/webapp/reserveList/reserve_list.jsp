<%@page import="vo.PageInfo"%>
<%@page import="vo.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
ArrayList<ReserveVO> articleList = (ArrayList<ReserveVO>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
ReserveVO article = (ReserveVO) request.getAttribute("article");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>예약 내역</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>


<style>
body {
	background-color: #f5f6f7;
}

.content_all {
	width: 80%;
	margin: 0 auto;
	margin-bottom: 20px;
}

/* 공지사항*/
.title {
	font-size: 36px;
	font-weigth: bold;
	text-align: center;
	width: 80%;
	margin: 0 auto;
	padding: 30px 0;
}

/* 리스트 테이블 */
.list_table {
	font-size: 13px;
	width: 80%;
	margin: 0 auto;
	margin-bottom: 40px;
	text-align: center;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.list_table th {
	padding: 14px 0;
}

.list_table td {
	padding: 12px 0;
	border-top: 1px solid #e7e7e7;
}

.delete_btn:hover {
	cursor: pointer;
}

#td_r_num {
	color: #333;
	font-weight: bold;
}

.list_table a {
	color: #333;
	line-height: 1.4;
	vertical-align: middle;
	text-decoration: none;
}

.list_table a:hover {
	text-decoration: underline;
}

/* 페이징 처리 */
#pageList {
	width: 95%;
	margin: 0 auto;
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

/* 검색 */
#search_table {
	width: 95%;
	margin: 0 auto;
	margin-top: 30px;
}

#search_table td {
	vertical-align: bottom;
}

#search_select {
	padding: 14px 10px;
	border: 1px solid #999;
	font-size: 0.9em;
}

.search_sub {
	text-align: left;
}

#search_value {
	width: 250px;
	padding: 14px 15px;
	border: 1px solid #999;
	outline: none;
}

#search_btn {
	border: 1px solid #999;
	vertical-align: bottom;
	background-color: #999;
	color: #fff;
	cursor: pointer;
	height: 54px;
	padding: 0 15px;
}

/* 보여줄 리스트가 없을 때 공간 */
#emptyArea {
	margin: 100px auto;
	width: 80%;
	text-align: center;
}
</style>

<script>
	/* 취소/삭제 시 경고창 */

	$(function() {
		$(".delete_btn").on("click", function() {

			if (confirm("정말 해당 예약을 삭제하시겠습니까 ?") == true) {
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
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="content_all">
		<p class="title">예약 내역</p>

		<!-- 리스트 -->
		<table class="list_table">
			<%
			if (articleList != null && listCount > 0) {
			%>

			<tr id="tr_top">
				<th scope="col">예약 번호</th>
				<th scope="col">ID</th>
				<th scope="col">이름</th>
				<th scope="col">예약룸</th>
				<th scope="col">예약 시간</th>
				<th scope="col">가격</th>
				<th scope="col">핸드폰 번호</th>
				<th scope="col">예약일자</th>
				<th scope="col" colspan="2">관 리</th>
			</tr>


			<%
			for (int i = 0; i < articleList.size(); i++) {
			%>
			<tr>
				<td id="td_r_num"><%=articleList.get(i).getR_NUM()%></td>
				<td><%=articleList.get(i).getR_ID()%></td>
				<td><%=articleList.get(i).getR_NAME()%></td>
				<td><%=articleList.get(i).getR_ROOM()%>번방</td>
				<td><%=articleList.get(i).getR_STIME()%>:00 - <%=articleList.get(i).getR_ETIME()%>:00</td>
				<td><%=articleList.get(i).getR_PRI()%> 원</td>
				<td><%=articleList.get(i).getR_PH()%></td>
				<td><%=articleList.get(i).getR_DATE() %>
				<td><a style="color: gray;"
					href="reserveModify.go?r_num=<%=articleList.get(i).getR_NUM()%>&page=<%=nowPage%>">
						예약 수정</a></td>
				<td class="td_center">
					<form name="delete_form" method="post"
						action="reserveDelete.go?r_num=<%=articleList.get(i).getR_NUM()%>">
						<a class="delete_btn" style="color: gray;">예약 취소</a>
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table>

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
				onClick="location.href='reserveList.go?page=<%=nowPage - 1%>'">이전</button>
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
				onClick="location.href='reserveList.go?page=<%=a%>'"><%=a%>
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
				onClick="location.href='reserveList.go?page=<%=nowPage + 1%>'">다음
			</button>
			<%
			}
			%>
		</section>
		<%
		} else {
		%>
		<section id="emptyArea">예약이 없습니다.</section>
		<%
		}
		%>

		<!-- 예약 검색창 -->
		<form action="reserveSearch.go" method="post">
			<table id="search_table">
				<tr>
					<td colspan="4" style="text-align: center; padding: 15px;"><select
						name="search" id="search_select">
							<!--  찾을 조건들 -->
							<option value="id" class="search_sub">아이디
							<option value="num" class="search_sub">예약 번호
							<option value="name" class="search_sub">이름
							<option value="ph" class="search_sub">핸드폰 번호
								<!--  찾을 조건들 -->
					</select> <input type="text" name="search_value" id="search_value"
						placeholder="검색할 정보를 입력해주세요." maxlength="200"><button id="search_btn" type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<%@ include file="/footer.jsp"%>
	</div>
</body>
</html>