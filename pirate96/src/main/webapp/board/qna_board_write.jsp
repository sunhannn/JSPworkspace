<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style>

nav ul{
    margin: auto;
    position: absolute;
    left: 220px;
    font-size: 16px;
}

*{
    margin: 0px; padding: 0px;   
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
#menubar{
    position: fixed;
    top: 20px;
    right: 10px;
    text-align: center;
    color: white;
}
#menubar a{color: white;}

nav ul{
    margin: auto;
    position: absolute;
    bottom: 10px;
    left: 220px;
    font-size: 16px;
}
nav ul a:hover{color: red;}

nav li{
    text-align: auto;
    display: inline-block;
    margin: 30px;
}
nav li a{color: white;}

h4 {
	text-align: center;
}
 
table {
	margin: auto;
	width: 1000px;
	text-align: center;
	border-radius: 10px;
}

.td_left {
	width: 50px;
	background: #f8f8f8;
	border-radius : 10px 0 0 10px;
	margin: 10px 0;
}

.td_right {
    border: none;
	width: 300px;
	background: #f8f8f8;
	margin: 10px 0;
}

#commandCell {
	text-align: center;
}

textarea{
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

#BOARD_NAME, #BOARD_PASS, #BOARD_SUBJECT, #BOARD_CONTENT{
width: 100%;
}
#BOARD_CONTENT{
margin: 0;
}

</style>
</head>
<body>

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
 
	<section id="writeForm">
		<h4>게시판글등록</h4><br><br>
		<form action="../boardWritePro.go" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="BOARD_NAME">작성자</label></td>
					<td class="td_right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_SUBJECT">제 목</label></td>
					<td class="td_right"><input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="80" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					<td class="td_right"><input name="BOARD_FILE"type="file" id="BOARD_FILE"  /></td>
				</tr>
			</table>
			<br>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp; <input type="reset" value="다시쓰기" />
			</section>
		</form>
	</section>
	<hr style="navy">
	<footer class="footer"><br>
      <p style="background-color: #f5f6f7; margin:0;">현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
      <p style="background-color: #f5f6f7; margin:0;">카피라이터: 1조 평균나이 96년생</p>
      <p style="background-color: #f5f6f7; margin:0;">팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
     </footer><!--footer영역끝--> 
	</div>
	
	<!-- 게시판 등록 -->
</body>
</html>