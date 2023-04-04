<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
ArrayList<BoardVO> articleList = (ArrayList<BoardVO>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항 리스트</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style>
body{
background-color: #f5f6f7;
}
   .content_all{
   width: 80%;
   margin: 0 auto;
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
      width: 75%;
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
   
   #td_r_num{
   color:#333;
   font-weight: bold;
   }
   
   .list_table a{
   color: #333;
   line-height: 1.4;
   vertical-align: middle;
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
   margin: auto;
   width: 500px;
   text-align: center;
}
#list_table{
margin:0 auto;
}

.list_a{
float:right;
}



</style>
</head>

<body>
			<%@ include file="/header.jsp" %>
	<!-- 게시판 리스트 -->
	<div class="content_all">
		<section>
				<div class="page-title">
					<p class="title">공지사항</p>
				</div>

                   
					<table class="list_table">
						<%
						if (articleList != null && listCount > 0) {
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
							for (int i = 0; i < articleList.size(); i++) {
							%>
							<tr>
								<td><%=articleList.get(i).getBOARD_NUM()%></td>

								<td>
								<a style="color: gray;"href="boardDetail.go?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
										<%=articleList.get(i).getBOARD_SUBJECT()%>
								</a></td>

								<td><%=articleList.get(i).getBOARD_NAME()%></td>
								<td><%=articleList.get(i).getBOARD_DATE()%></td>
								<td><%=articleList.get(i).getBOARD_READCOUNT()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					
					</section>
				
				<c:if test="${ 'admin' eq id }">
		<div class="list_a"><a href="boardWriteForm.go" style="color:black;">게시판글쓰기</a></div>
				</c:if>
        
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
			<button type="button" class="paging_btn" onClick="location.href='boardList.go?page=<%=nowPage - 1%>'">이전</button>&nbsp;
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
			<button class="paging_btn" onClick="location.href='boardList.go?page=<%=a%>'"><%=a%>
			</button>
			&nbsp;
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nowPage >= maxPage) {
			%>
			<button type="button" class="paging_btn">
         다음
         </button>
			<%
			} else {
			%>
			<button type="button" class="paging_btn" onClick="location.href='boardList.go?page=<%=nowPage + 1%>'">다음
         </button>
			<%
			}
			%>
		</section>
		
		<%
		} else {
		%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
						<c:if test="${ 'admin' eq id }">
		<div class="list_a"><a href="boardWriteForm.go" style="color:black;">글쓰기</a></div>
				</c:if>
		<%
		}
		%>
		      <form action="boardSearch.go" method="post">
              <table id="search_table">
            <tr>
               <td colspan="2" style="text-align: center; padding: 15px;"><select name="search" id="search_select">
                     <!--  찾을 조건들 -->
                     <option value="num" class="search_sub">글 번호
                     <option value="subject" class="search_sub">제목
                        <!--  찾을 조건들 -->
                 </select> 
                 <input type="text" name="search_value" id="search_value" placeholder="검색할 정보를 입력해주세요." maxlength="200"><button id="search_btn" type="submit">검색</button></td>
            </tr>
         </table>
      </form>
		
	</div>
   <div class="footer">
<%@ include file="/footer.jsp" %>
   </div>
</body>
</html>