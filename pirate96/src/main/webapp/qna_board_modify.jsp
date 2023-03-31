<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
BoardVO article = (BoardVO) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width,initial-scale=1">
<title>공지사항 수정</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
<style>
body{
background-color: #f5f6f7;
}
.content_all{
width:80%;
margin:0 auto;
}
   .button{
   background-color:#aacef2;
   border:none;
   border-radius:5px;
   padding: 0.375rem 0.75rem;
   font-size: 1rem;
   }
   
   .btn_zone{
   width: 75%;
   margin: 0 auto;
   text-align:center;
}
#BOARD_CONTENT{
  resize : none;
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  line-height: 1.5;
  border-radius: 5px;
  border: 1px solid #ccc;
  margin-bottom: 10px;
}
#BOARD_NAME, #BOARD_SUBJECT, #BOARD_CONTENT{
 border:1px solid #e7e7e7;
 border-radius: 5px;
}
.left {
	width: 70px;
	margin: 0;
	display:block;
}

.right {
    border: none;
	width: 90%;
	margin: 0;
	display:block;
}
.write_table{
	width: 90%;
	margin:0 auto;
}
.write_title{
font-size:36px;
font-weight:bold;
width:95%;
padding: 30px 0;
border-bottom:2px solid #000;
}
#BOARD_NAME, #BOARD_SUBJECT, #BOARD_CONTENT{
width: 100%;
}
#BOARD_CONTENT{
margin: 0;
}
.ptext{
    font:0.8em; 
    font-weight: bold; 
    margin: 0;
	vertical-align:bottom;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
	<!-- 게시판 등록 -->
	<div class="content_all">

		<section>
			<p class="write_title">공지사항</p>
			<form action="boardModifyPro.go" method="post" name="modifyform">
				<input type="hidden" name="BOARD_NUM"
					value="<%=article.getBOARD_NUM()%>" />
				<table class="write_table">
					<tr>
						<td class="left"><label for="BOARD_NAME"><p class="ptext">작성자</p></label></td>
						<td class="right"><input type="text" name="BOARD_NAME"
							id="BOARD_NAME" value="<%=article.getBOARD_NAME()%>" /></td>
					</tr>
					<tr>
						<td class="left"><label for="BOARD_SUBJECT"><p class="ptext">제목</p></label></td>
						<td class="right"><input name="BOARD_SUBJECT" type="text"
							id="BOARD_SUBJECT" value="<%=article.getBOARD_SUBJECT()%>" /></td>
					</tr>
					<tr>
						<td class="left"><label for="BOARD_CONTENT"><p class="ptext">내용</p></label></td>
						<td class="right"><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
								cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea></td>
					</tr>
				</table>
				<section class="btn_zone">
				<button type="button" class="button" style="background-color:#aacef2; color:black;" onclick="location.href='javascript:modifyboard()'">수정</button>
				<button type="button" class="button" style="background-color:#aacef2; color:black;" onclick="location.href='javascript:history.go(-1)'">뒤로</button>
				</section>
			</form>
		</section>
	</div>
	   <div class="footer">
<%@ include file="/footer.jsp" %>
   </div>
</body>
</html>