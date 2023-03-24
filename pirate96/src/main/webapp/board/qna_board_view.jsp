 <%@page import="vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
    String nowPage = (String)request.getAttribute("page");
%>
<%
BoardBean article = (BoardBean)request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style type>
nav ul{
    margin: auto;
    position: absolute;
    left: 220px;
    font-size: 16px;
}

nav ul a:hover{
    color: red;
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

#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 500px;
	text-align: center;
}
.button {

  background-color: white;

  border: none;

  color: black;

  padding: 10px;

  text-align: center;

  text-decoration: none;

  display: inline;

  font-size: 10px;

  margin: 4px;

  cursor: pointer;

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
 
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제 목 :
			<%=article.getBOARD_SUBJECT()%>
			첨부파일 :
			<%if(!(article.getBOARD_FILE()==null)){ %>
			<a href="filedown.go?fname=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE() %>
			</a>
			<%} %>
		</section>
		<section id="articleContentArea">
			<%=article.getBOARD_CONTENT() %>
		</section>
	</section>
	<section id="commandList">
		<a href="boardModifyForm.go?board_num=<%=article.getBOARD_NUM() %>">[수정] </a> 
<%-- 		<a href="boardDeleteForm.go?board_num=<%=article.getBOARD_NUM() %>&page=${page }"> [삭제] </a>  --%>
        <script>
        function test() {
            if (!confirm("정말 삭제하시겠습니까?")) {
            	return false;
            } else {
                alert("삭제 되었습니다.");
            }
        }
        </script>
        <form name="deleteForm" action="boardDeletePro.go?board_num=<%=article.getBOARD_NUM() %>" method="post">
        <input type = "hidden" name = "page" value = "<%=nowPage %>"/>
        <button type="submit" class="button" onclick="return test()">삭제</button>
        </form>
		<a href="boardList.go?<%=article.getBOARD_NUM() %>page=${page }">[목록]</a>&nbsp;&nbsp;
	</section>
	<hr style="navy">
	<footer class="footer"><br>
      <p style="background-color: #f5f6f7; margin:0;">현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
      <p style="background-color: #f5f6f7; margin:0;">카피라이터: 1조 평균나이 96년생</p>
      <p style="background-color: #f5f6f7; margin:0;">팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
     </footer><!--footer영역끝--> 
	</div>
</body>
</html>
		