<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- -start- 관리자 아이디인지 세션 확인 -->
	<%
// 		String user_id = request.getParameter("id");  // 로그인으로 받아온 아이디(합칠 때 name값 확인★)
// 		String user_pw = request.getParameter("passwd"); // 로그인으로 받아온 비밀번호(합칠 때 name값 확인★) 
// 		boolean return_main = false;
// 		if(user_id.equals("admin") && user_pw.equals("1234")) {
// 			session.setAttribute("userID", user_id);
// 			session.setAttribute("userPW", user_pw);
// 			} else {
// 			return_main = true;
// 		}

// 		if(return_main)
// 		{
// 			// 관리자 계정이 아닐 시 메인 페이지로 이동
// 		    out.print("<script>alert('권한이 없습니다.'); location.href ='main.jsp';</script>");
// 		}

		// 로그인 연결 전 test로 설정한 값, 연결하면 삭제 요망(★)
		String user_id = "admin";  // 로그인으로 받아온 아이디(합칠 때 name값 확인★)
		String user_pw = "1234"; // 로그인으로 받아온 비밀번호(합칠 때 name값 확인★) 		

		session.setAttribute("id", user_id);
		session.setAttribute("pw", user_pw);
		// 로그인 연결 전 test로 설정한 값, 연결하면 삭제 요망(★)
	%>
<!-- -end- 관리자 아이디인지 세션 확인 -->
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>관리자 페이지</title>
  <!--외부 스타일시트 적용-->
  <link rel="stylesheet" href="css/main.css">

  <style>

.content_all{
width: 80%;
margin:0 auto;
}

#admin_title{
font-size:36px;
font-weight:bold;
width:95%;
padding: 25px 0;
border-bottom:2px solid #000;
}

#menu{
	text-align: center;
	font-size:22px;
	font-weight: bold;
	color: #333;
}

#admin_btn_table{
	width: 80%;
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid #ccc;
}

#admin_btn_table td{
padding: 50px 10px;
}

.admin_menu_btn{
      border-radius: 100px; /*모서리 둥글게*/
      border: 2px solid rgb(218, 218, 218);
      width: 80%;
      height: 40%;
}

.admin_menu_btn:hover {
  background-color: rgb(228, 225, 221);
}

.admin_menu_btn:active {
  border: 2px solid #eaedf0;
  background-color: rgb(233, 224, 224);
}

.admin_menu_btn p{
      font-size: 20pt;
      font-weight: bold;
      color: #888;
      margin-top: 5px;
}

.admin_menu_btn img{
width:230px;
height:250px;
}

  </style>
</head>

<body style="background-color:#f5f6f7;">
<jsp:include page="/header.jsp" flush="true"></jsp:include>
<div class="content_all">
		<p id="admin_title">관리자 페이지</p>
		<p id="menu">MENU</p>
		
		<table id=admin_btn_table>
          	<tr>
          	<td>
            <button type="button" class="admin_menu_btn" onClick="location.href='reserveList.go'">
            <img src="img/reserve_icon.png">
            <p>예약 관리</p>
            </button>
            </td>
            <td>
            <button type="button" class="admin_menu_btn" onClick="location.href='memberList.go'">
            <img src="img/member_icon.png">
            <p>회원 목록</p>
            </button>
            </td>
            <td>
            <button type="button" class="admin_menu_btn" onClick="location.href='boardList.go'"><!-- ★ -->
            <img src="img/board_icon.png">
            <p>공지</p>
            </button>
            </td>
            </tr>
			</table>	
</div>
<%@ include file="/footer.jsp" %>
</body>

</html>
