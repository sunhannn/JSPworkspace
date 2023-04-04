<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
/* form의 길이(푸터길이를 줄이기 위해) */
form {

height:270px;}






/*div 로고 */
.logo {
text-align:center;
font-size: larger;
}
/* 아이디,비밀번호 input type */
.login {

margin: 100px 0px 30px 360px;
	float: left;
	display:inline;
	
}

/* 로그인 버튼 */
#submitlogin {
padding: 55px 35px;
border: 1px solid lightgray;
margin:100px 10px 30px 20px;
background-color:#3B4A71;
color:white;


}


/* 로고크기 */
h1{
 margin:150px 0px 0px 0px;
font-size:50px;}
/* 아이디 input */
 #id {
 width:240px;
 height:60px;
 border-radius : 0px;
 margin:0px 0px 5px 0px; 
 text-align:center;
 }
/*  비밀번호 input */
 #password {
 
width:240px;
 height:60px;
 border-radius : 0px;
 text-align:center;}
 

/*   회원가입버튼  */

#joinbutton {
font-size:18px;
display:block;
color:gray;
margin-top:10px;}

  

  </style>
  <script>
  let str='<%=request.getParameter("error")%>';
  if(!(str=='' || str=='null')) {alert('로그인에 실패했습니다.');}
  
  
  </script>
  
  
  
  
</head>
<body style="background-color:#f5f6f7;">
<%@ include file="/header.jsp" %>
<section id = "loginformArea">
<div class="wrapper">

<form name="loginform" action="memberLoginAction.go" method="post">
<div class="container" >

<!-- 로고 h1부분에 넣을것 -->
<div class="logo">
<h1>유 키</h1>
</div>

<div class="login">

	
<div class="form-group">

<input type="text" class="form-control" id="id" name="M_ID" placeholder="아이디">

</div>




<div class="form-group">

<input type="password" class="form-control" id="password" name="M_PW" placeholder="비밀번호" >

<div class="joinbutton">

<a href="joinForm.jsp" id ="joinbutton">회원가입</a>
</div>
</div>
</div>

<div class="form-group">

<input type="submit" value="로그인" id="submitlogin">

  </form>
  

</div>
</div>

<div style="width: 100%; height: 200px;"></div>

<%@ include file="/footer.jsp" %>
</div>


</body>
<html>
