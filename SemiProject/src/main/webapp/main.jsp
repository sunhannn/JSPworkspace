<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src='js/jquery.js'></script>
 <!--외부 스타일시트 적용-->
 <link rel="stylesheet" href="./main.css">

<script>
    
</script>
</head>
<body>
  
  <div id="body-wrapper">
    <div id="body-content">
  
    <form action="" method="post">
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
             <li><a href="#" onclick="location.href='ex01.html'">공지</a></li>
             <li><a href="#" onclick="location.href='ex02.html'">공간소개 및 오시는 길</a></li>
             <li><a href="#" onclick="location.href='firstRev.jsp'">스터디룸 예약</a></li>                      
            </ul>
          </nav>        
         </header>
        </div>
       <section class="main_img"> 
         <img src="img/스터디룸이미지1.jpg" alt="메인이미지" style="width: 100%; height: 500px;">
       </section><br><br>
        
        
        <hr style="border: 5px double  yellowgreen">
       <div id="gongji">  
         <img src="" alt="">
         <h3>*공지작성칸입니다.*</h3>
         <p>공지 1</p>
         <p>공지 2</p>
         <p>공지 3</p>
       </div><br><br>

       <div id="reserve"><!--예약방법 작성영역-->
         <div style="float: left;">
           <img src="img/스터디룸이미지2.jpg" alt="예약이미지" style="width: 450px; height: 350px;">
         </div><br><br> 
         <div>
           <h3>*스터디룸 예약방법*</h3>
           <p>방법1</p>
           <p>방법2</p>
           <p>방법3</p>
         </div><br>
       </div><br><br>
      
        
        <div id="map" style="width: 450px; height: 350px;" ><br> <!--구글지도- 위치변경시 src에 지도소스넣으면됨 -->
          <h3>*공간소개 및 오시는 길*</h3><br>
          <div style="float: left;">
             <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6339.176514240069!2d126.92403290000001!3d37.3995685!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b619d64bd63cd%3A0x53b7daa94a950172!2z656t7Iqk7YSw65SU7Lm07Y6YIOyViOyWkeyXreygkA!5e0!3m2!1sko!2skr!4v1679272950532!5m2!1sko!2skr" 
               width="600" height="450" style="border:0;" allowfullscreen="false" 
               loading="lazy" referrerpolicy="no-referrer-when-downgrade">   
             </iframe>
            </div>
            <div>
               <h4>*주변 교통정보*</h4>
               <p>1.장소에 대한 주변대중교통이용방법 설명칸입니다.</p>
                <p>2.주변에 근접한 버스정류장</p>
                <p>3.주변에 근접한 전철역</p>
            </div>
         </div><br><br>
       
        </div>
       </form>

      <!--footer영역--><!--<footer class="footer"> 
        <h3>현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</h3><br>
        <h4>카피라이터: 1조 평균나이 96년생</h4><br>
        <h5>팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</h5>
       </footer>--><!--footer영역끝-->  
      </div>
    </div>
   
</body>
</html> 