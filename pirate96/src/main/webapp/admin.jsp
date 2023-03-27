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

		session.setAttribute("userID", user_id);
		session.setAttribute("userPW", user_pw);
		// 로그인 연결 전 test로 설정한 값, 연결하면 삭제 요망(★)
	%>
<!-- -end- 관리자 아이디인지 세션 확인 -->
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>관리자 페이지</title>
  <script src='js/jquery.js'></script>
  <!--외부 스타일시트 적용-->
  <link rel="stylesheet" href="css/main.css">

  <style>
   /* 관리자 페이지 입니다. */
    #welcome_admin{
	font-size: 15px;
	color: #333333;
	font-weight: bold;
	text-align: left;
}


	/* 버튼 있는 테이블 */
#admin_btn_table{
	border-collapse: collapse;
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
}
  
  td{
  padding-top:20px;
  }
  
  /* 예약관리, 회원관리 선택하는 버튼 */
    .admin_menu_btn {
      border-radius: 100px; /*모서리 둥글게*/
      border: 2px solid rgb(218, 218, 218);
      padding: 0 8%;
      padding-bottom: 50px;
      margin: 25px 0;
    }
   
   /* 버튼 텍스트 */
    .admin_menu_btn_text{
      font-size: 20pt;
      font-weight: bold;
      color: #888;
    }

/* 버튼들 각 상황 별 css */
    .admin_menu_btn:hover {
      background-color: rgb(228, 225, 221);
    }

    .admin_menu_btn:active {
      border: 2px solid #eaedf0;
      background-color: rgb(233, 224, 224);
    }

/* MENU 문구 */    
    #admin_page{
    	margin: auto;
    	width: 70%;
    	color: #444;
    	font-weight: bold;
    	font-size: 24pt;
    }
    
    input, select{
    border:0;
    }
    

  </style>
</head>

<body>


  <div class="wrapper">

    <form method="post">
      <div id="mainpage">
        <header>
          <div id="logo"> <!--이미지로고 추가할시 사용-->
            <img src="" alt="">
          </div><!--로고 div영역끝-->
          <div id="login"> <!--로그인 부분-->
            <a href="#">LOGIN</a>
          </div><!--로그인 div영역끝-->

          <nav> <!--메뉴바 목록들-->
            <ul class="menubar">
              <li><a href="#">HOME</a></li>
              <li><a href="#" onclick="location.href='info.html'">공지</a></li>
              <li><a href="#" onclick="location.href='showcase.html'">공간소개 및 오시는 길</a></li>
              <li><a href="#" onclick="location.href='reserve.html'">스터디룸 예약</a></li>
            </ul>
          </nav>
        </header>
      </div>
      <div class="container">
        <div class="main"><!--화면양쪽에 여백부여-->
        
          <div class="admin_area">
          	<p id="welcome_admin">관리자 페이지</p>
          	<p id="admin_page">MENU</p>
          	<br>
          	<table id=admin_btn_table>
          	<tr>
          	<td>
            <button type="button" class="admin_menu_btn" onClick="location.href='reserveList.go'">
            <img src="img/reserve_icon.png" width="230px" height="250px">
            <div style="height:70px;"></div><!-- 버튼에서 이미지랑 텍스트 거리 띄워주는 div -->
            <span class="admin_menu_btn_text">예약 관리</span>
            </button>
            </td>
            <td>
            <button type="button" class="admin_menu_btn" onClick="location.href='memberList.go'">
            <img src="img/member_icon.png" width="230px" height="250px">
            <div style="height:70px;"></div><!-- 버튼에서 이미지랑 텍스트 거리 띄워주는 div -->
            <span class="admin_menu_btn_text">회원 목록</span>
            </button>
            </td>
            <td>
            <button type="button" class="admin_menu_btn" onClick="location.href='공지'"><!-- ★ -->
            <img src="img/board_icon.png" width="230px" height="250px">
            <div style="height:70px;"></div><!-- 버튼에서 이미지랑 텍스트 거리 띄워주는 div -->
            <span class="admin_menu_btn_text">공지</span>
            </button>
            </td>
            </tr>
			</table>	         
          </div><br><br>
		</div>

          <div style="clear: both;"></div><!--영역아래의 div가 따라올라가는 것을 방지-->

          <!--예약방법 작성영역-->
          <div style="clear: both;"></div><!--영역아래의 div가 따라올라가는 것을 방지-->
        </div><!--div의 container클래스 끝위치-->
    </form>
    <div style="width: 100%; height: 100px;"></div><!--본문과 footer를 나누기위한 div-->
      <!--footer영역-->
      <hr>
      <footer class="footer"><br>
        <p>현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
        <p>카피라이터: 1조 평균나이 96년생</p>
        <p>팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
      </footer>
      <!--footer영역끝-->
    
  </div><!--wrapper의 끝위치-->
</body>

</html>
