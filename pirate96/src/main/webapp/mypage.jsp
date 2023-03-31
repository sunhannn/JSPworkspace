<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@page import="vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>

/* 전체페이지 */

*{
margin:0;
padding:0;}

body {
background-color:#f5f6f7;
}
.content_all {

width:95%;
margin:0 auto;
height:300px;}


.title {
font-size :28px;
font-weight: bold;
width:80%;
height:60px;
margin-top:30px;
margin-bottom:20px;
margin-left:200px;
}

/* 마이페이지밑 hr */
.mypage_{
    height: 3px;
    background: #000;
border:0;
margin-left:90px;
margin-top:10px;

width:90%;}

.text_zone {

width:90%;
margin:0 auto;

height:5px;}


/* 테이블 */
table {
margin:auto;
margin-top:0;
text-align:center;
border:none;

height:400px;}

td {
margin:auto;
border:none;
width:400px;
height:3px;
} 

hr {

width:100%}

/* 내정보확인 */
.chkinfo {
padding:110px 95px;
font-weight:bolder;
color:rgb(136 136 136);
}


/* 예약목록확인 */
.revlist {
padding:110px 90px;
font-weight:bolder;
color:rgb(136 136 136);
}


/* 회원탈퇴 */
.deleteinfo {

padding:110px 90px;
font-weight:bolder;
color:rgb(136 136 136);}

/* 개인정보변경 */
.updateinfo {

padding:110px 90px;
font-weight:bolder;
color:rgb(136 136 136);}




.welcome {
margin-left:100px;
}



button:hover {
background-color:rgb(228,225,221);
}

input:hover {
background-color:rgb(228,225,221);
}

button:active {
border: 2px solid #eaedf0;
  background-color: rgb(233, 224, 224);
}

input:active {border: 2px solid #eaedf0;
  background-color: rgb(233, 224, 224);}
  
  .session {
  
 font-size:18px;
}

.menu {
text-align: center;
	font-size:22px;
	font-weight: bold;
	color: #333;}
	
	.menu_ {
	width:80%;
	margin-left:170px;
	}
</style>


</head>

<body>


<!-- 마이페이지 -->
<%@ include file="/header.jsp" %>
<div class="content_all">
	<p class="title">마이페이지</p>
		<hr class="mypage_">
			<div class="text_zone">
			<div class="welcome">
			
		
	
			</div>

 </div>
 <p class="menu">MENU</p>
 <hr class="menu_">
<table>
<tr>
<td><form action="./myinfo.go">
    	<button type="submit" class="chkinfo" style="border-radius:80px; border: 2px solid rgb(218, 218, 218);" >내정보</button>
    	
	</form></td><td><form action ="updatepage.jsp">
		<input type="submit" value="정보변경" class="updateinfo" style="border-radius:80px; border: 2px solid rgb(218, 218, 218);">
	</form></td><td><form action ="memberDeleteAction.go"  >
		<input type="submit" value="회원탈퇴" class="deleteinfo" style="border-radius:80px;  border: 2px solid rgb(218, 218, 218);">
	</form></td><td><form action="revList.go" class="chkrevlist">
		<button type="submit" class="revlist" style="border-radius:80px;  border: 2px solid rgb(218, 218, 218);">예약목록</button>
	</form></td>
</tr>
</table>
	
	


<!-- </div>  -->
<%@include file="footer.jsp" %>

</div>
</body>
</html>