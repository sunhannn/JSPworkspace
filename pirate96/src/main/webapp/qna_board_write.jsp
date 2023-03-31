<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항 글쓰기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style>

body{
background-color: #f5f6f7;
}

.content_all{
width:80%;
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

.text_zone{
width:75%;
margin:0 auto;
margin-left: 10%;
}

.btn{
background-color:#aacef2;
}
   
.btn_zone{
margin:0 auto;
margin-top:20px;
margin-bottom:30px;
text-align:center;
}

.btn:hover{
    background-color: #75b2fo;
}

.left {
	width: 70px;
	margin: 0;
	display:block;
}

.right {
    border: none;
	width: 100%;
	margin: 0;
	display:block;
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

#BOARD_FILE{
 display: inline;
}

.ptext{
    font:0.8em; 
    font-weight: bold; 
    margin: 0;
	vertical-align:bottom;
}

.write_table{
	width: 90%;
	margin:0 auto;
}

#BOARD_NAME, #BOARD_SUBJECT, #BOARD_CONTENT{
 border:1px solid #e7e7e7;
 border-radius: 5px;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<div class="content_all">
	<section>
		<p class="write_title">공지사항</p>
		
		<div class="text_zone">
		<form action="boardWritePro.go" method="post" enctype="multipart/form-data" name="boardform">
			<table class="write_table">
				<tr>
					<td class="left"><label for="BOARD_NAME"><p class="ptext">작성자</p></label></td>
					<td class="right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" required="required" /></td>
				</tr>
                
				<tr>
                    
					<td class="left"><label for="BOARD_SUBJECT"><p class="ptext">제목</p></label></td>
					<td class="right"><input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required" /></td>
				</tr>
				<tr>
					<td class="left"><label for="BOARD_CONTENT"><p class="ptext">내용</p></label></td>
					<td class="right"><textarea name="BOARD_CONTENT" id="BOARD_CONTENT" cols="80" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="left"><label for="BOARD_FILE"><p class="ptext">파일첨부</p></label></td>
					<td class="right"><input name="BOARD_FILE"type="file" id="BOARD_FILE"/></td>
				</tr>
			</table>
			<br>
			<div class="btn_zone">
                <button type="reset" class="btn" style="background-color:#aacef2;">다시쓰기</button>
                <button type="submit" class="btn" style="background-color:#aacef2;">등록</button>
			</div>
		</form>
		</div>
	</section>
	
	</div>

	   <div class="footer">
<%@ include file="/footer.jsp" %>
   </div>
</body>
</html>