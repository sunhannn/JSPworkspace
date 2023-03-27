<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style type="text/css">

nav ul{
    margin: auto;
    position: absolute;
    bottom: 10px;
    left: 220px;
    font-size: 16px;
}
nav ul a:hover{

    color: red;
}

nav li{
    text-align: auto;
    display: inline-block;
    margin: 30px;
}
nav li a{
color: white;
}
table {
border-collapse: collapse;
}
section.notice {
padding: 80px 0;
}

.wrapper{ 
    background-color: #f5f6f7;
    margin-right: 0;
    min-height: 100%;
    padding-bottom: 100px;
    position: relative;
    margin: 0;
    padding: 0;
}
header{ /*header 영역*/
    position: fixed;
    width: 100%; /*메인이미지의 너비사이즈와 같음*/
    height: 100px;
    background-color:  #495264;
}
.footer{  /*footer하단고정*/
    width: 100%; /*헤더와 같은 사이즈*/
    height: 100px; /*footer의 높이*/
    color:navy;
    left: 0;
    background-color: #f5f6f7;
    bottom: 0; /*하단에 여백없이*/
    padding: 0;
    margin-top: 100px; /*footer 위쪽여백설정*/
    margin: 0;
}
.footer p{
    text-align: center;
}/*footer내부의 글자들 위치설정*/
ul{
    list-style: none;/*리스트 앞에 . 같은 것을 제거*/
    text-align: auto;
}
a{
 text-decoration: none;/*링크에 밑줄제거*/
}

#login{
    position: fixed;
    position: absolute;
    top: 40px;
    right: 50px;
}
      .page-title {
        margin-bottom: 60px;
      }
      .page-title h3 {
        font-size: 28px;
        color: #333333;
        font-weight: 400;
        text-align: center;
      }


      .board-table {
        font-size: 13px;
        width: 100%;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
      }

      .board-table a {
        color: #333;
        display: inline-block;
        line-height: 1.4;
        vertical-align: middle;
      }
      .board-table a:hover {
        text-decoration: underline;
      }
      .board-table th {
        text-align: center;
      }

      .board-table .th-num {
        width: 100px;
        text-align: center;
      }

      .board-table .th-date {
        width: 200px;
      }

      .board-table th,
      .board-table td {
        padding: 14px 0;
      }

      .board-table tbody td {
        border-top: 1px solid #e7e7e7;
        text-align: center;
      }

      .board-table tbody th {
        padding-left: 28px;
        padding-right: 14px;
        border-top: 1px solid #e7e7e7;
        text-align: left;
      }

      .board-table tbody th p {
        display: none;
      }


      * {
        list-style: none;
        text-decoration: none;
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }
      .clearfix:after {
        content: "";
        display: block;
        clear: both;
      }
      .container {
        width: 1100px;
        margin: 0 auto;
      }
#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
	font-color: black;
}
#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
.footer{  /*footer하단고정*/
    width: 100%; /*헤더와 같은 사이즈*/
    height: 100px; /*footer의 높이*/
    color:navy;
    left: 0;
    background-color: #f5f6f7;
    bottom: 0; /*하단에 여백없이*/
    padding: 0;
    margin-top: 100px; /*footer 위쪽여백설정*/
    margin: 0;
}
.footer p{
    text-align: center;
}
#write{
diplay:block;
text-aglin:right;
}
</style>
</head>

<body>
	<!-- 게시판 리스트 -->
<div class="wrapper">
<div id="mainpage">
  <header>
  <div id="login"><a href="#">LOGIN</a> </div>
    <nav>
      <ul class="menubar">
        <li><a href="#">홈</a></li>
        <li><a href="boardList.go">공지</a></li>
        <li><a href="#">Q&A</a></li>
        <li><a href="#">가격안내</a></li>
        <li><a href="#">공간소개 및 오시는 길</a></li>
        <li><a href="#">스터디룸 예약</a></li>
      </ul>
    </nav>
  </header>
</div> 
 <br><br><br><br><br><br><br>
	<section class="notice">
      <div class="page-title">
        <div class="container">
          <h3>공지사항</h3>
        </div>
      </div><br>
		
<div id="board-list">
        <div class="container">
          <table class="board-table">
<%
if(articleList != null && listCount > 0){
%>
            <thead>
              <tr>
                <th scope="col" class="th-num">번호</th>
                <th scope="col" class="th-title">제목</th>
                <th scope="col" class="th-date">작성자</th>
                <th scope="col" class="th-title">날짜</th>
                <th scope="col" class="th-date">조회수</th>
              </tr>
            </thead>

            <tbody>
              <%
		for(int i=0;i<articleList.size();i++){
			
	%>
			<tr>
				<td><%=articleList.get(i).getBOARD_NUM()%></td>

				<td>
					 <a style=color:gray; href="boardDetail.go?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
					<%=articleList.get(i).getBOARD_SUBJECT()%>
				</a>
				</td>

				<td><%=articleList.get(i).getBOARD_NAME() %></td>
				<td><%=articleList.get(i).getBOARD_DATE() %></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
            </tbody>
          </table>
        </div>
      </div>
    </section>

	<form action="reserveSearch.go">
	<table id="search_table">
	<tr>
	<td colspan="4" style="text-align: center; padding: 15px;">
	<select name="search" id="search_reserve_select">
	<!--  찾을 조건들 -->
	<option value="subject" class="reserve_search_sub">제목
	<option value="num" class="reserve_search_sub">글 번호
	<option value="name" class="reserve_search_sub">작성자
	<!--  찾을 조건들 -->
	</select> <input type="text" name="search_value" id="reserve_search_value" placeholder="검색할 정보를 입력해주세요." maxlength="200">
               <button id="search_submit" type="submit">검색</button></td>
	</tr>
	</table>
	</form>
	
<%-- <%if("admin".equals(session.getAttribute("userID").toString())){%> --%>
<!-- <a href="boardWriteForm.go" id="write">게시판글쓰기</a> -->
<%-- <% } %>  --%>		
<c:if test="${ 'admin' eq id }">
<a href="boardWriteForm.go" id="write">게시판글쓰기</a>
</c:if>

	<section id="pageList">
		<%if(nowPage<=1){ %>
		[이전]&nbsp;
		<%}else{ %>
		<a href="boardList.go?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="boardList.go?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[다음]
		<%}else{ %>
		<a href="boardList.go?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<a href="boardWriteForm.go" id="write">게시판글쓰기</a>
	<%
	}
%>
<hr style="navy">
	<footer class="footer"><br>
      <p style="background-color: #f5f6f7; margin:0;">현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
      <p style="background-color: #f5f6f7; margin:0;">카피라이터: 1조 평균나이 96년생</p>
      <p style="background-color: #f5f6f7; margin:0;">팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
     </footer><!--footer영역끝--> 
</div>
</body>
</html>