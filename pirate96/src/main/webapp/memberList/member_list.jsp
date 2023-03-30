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
// 		String user_id = (String)session.getAttribute("id");  // 이전 페이지에서 로그인으로 받아온 아이디
// 		String user_pw = (String)session.getAttribute("pw"); // 이전 페이지에서 로그인으로 받아온 비밀번호 
// 		boolean return_main = false;
		
// 		if(user_id==null || user_pw==null || !(user_id.equals("admin") || user_pw.equals("1234"))) {
// 			return_main = true;
// 		}
		
// 		if(return_main)
// 		{
// 			// 관리자 계정이 아닐 시 메인 페이지로 이동
// 		    out.print("<script>alert('권한이 없습니다.'); location.href ='main.jsp';</script>");
// 		}
 	%>
<!-- -end- 관리자 아이디인지 세션 확인 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원 목록</title>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
	
	<style>
	
	.content_all{
	width: 80%;
	margin: 0 auto;
	margin-bottom: 20px;
	}
	
	/* 공지사항*/
	.title{
	font-size: 36px;
	font-weigth: bold;
	text-align: center;
	width: 80%;
	margin: 0 auto;
	padding: 30px 0;
	}
	
	/* 리스트 테이블 */
	.list_table{
		font-size: 13px;
		width: 80%;
		margin:0 auto;
		margin-bottom: 40px;
		text-align: center;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	
	.list_table th{
	padding: 14px 0;
	}
	
	.list_table td{
	padding: 12px 0;
	border-top: 1px solid #e7e7e7;
	}
	
	.delete_btn:hover{
	cursor:pointer;
	}
	
	#td_r_num{
	color:#333;
	font-weight: bold;
	}
	
	.list_table a{
	color: #333;
	line-height: 1.4;
	vertical-align: middle;
	text-decoration: none;
	}
	
	.list_table a:hover{
	text-decoration:underline;
	}
	
	/* 페이징 처리 */
	#pageList {
	width: 95%;
	margin:0 auto;
	text-align: center;
	font-color: black;
	}
	
	/* 페이징 버튼 css */
	.paging_btn{
	background-color:#f5f6f7;
	outline: none;
	border: 0;
	cursor:pointer;
	padding: 3px;
	}
	
	button.select{
	font-weight: bold;
	border: 1px solid #ccc;
	}
	
	/* 검색 */
	#search_table{
	width:95%;
	margin: 0 auto;
	margin-top: 30px;
	}
	
	#search_table td{
	vertical-align: bottom;
	}
	
	#search_select{
	padding: 14px 10px;
	border: 1px solid #999;
	font-size: 0.9em;
	}
	
	.search_sub{
	text-align: left;
	}
	
	#search_value{
	width: 250px;
	padding: 14px 15px;
	border: 1px solid #999;
	outline:none;
	}
	
	#search_btn{
	border: 1px solid #999;
	vertical-align: bottom;
	background-color:#999;
	color:#fff;
	cursor:pointer;
	height:54px;
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

</head>
<body style="background-color:#f5f6f7;">
<%@ include file="/header.jsp" %>
	<div class="content_all">
		<p class="title">회원 목록</p>
		
		<!-- 리스트 -->
		<table class="list_table">
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
		</table>

		<!-- 페이지 리스트(페이징) -->
		<section id="pageList">
			<%
			if (nowPage <= 1) {
			%>
			<button type="button" class="paging_btn">
			이전
			</button>
			<%
			} else {
			%>
			<button type="button" class="paging_btn" onClick="location.href='memberList.go?page=<%=nowPage - 1%>'">이전</button>&nbsp;
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
			<button class="paging_btn" onClick="location.href='memberList.go?page=<%=a%>'"><%=a%>
			</button>
			<%
			}
			%>
			<%
			}%>
			

			<%
			if (nowPage >= maxPage) {
			%>
			<button type="button" class="paging_btn">
			다음
			</button>
			<%
			} else {
			%>
			<button type="button" class="paging_btn" onClick="location.href='memberList.go?page=<%=nowPage + 1%>'">다음
			</button>
			<%
			}
			%>
		</section>
		<%
		} else {
		%>
		<section id="emptyArea">회원이 없습니다.</section>
		<%
		}
		%>
					
		<!-- 예약 검색창 -->
		<form action="memberSearch.go" method="post">
			<table id="search_table">
				<tr>
					<td colspan="4" style="text-align: center; padding: 15px;"><select
						name="search" id="search_select">
							<!--  찾을 조건들 -->
								<option value="id" class="search_sub">아이디
								<option value="name" class="search_sub">이름
								<option value="ph" class="search_sub">핸드폰 번호
								<option value="addr" class="search_sub">주소
								<option value="email" class="search_sub">이메일
								<option value="gender" class="search_sub">성별
							<!--  찾을 조건들 -->
					</select> <input type="text" name="search_value"
						id="search_value" placeholder="검색할 정보를 입력해주세요." maxlength="200"><button id="search_btn" type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
			<%@ include file="/footer.jsp" %>
</body>
</html>