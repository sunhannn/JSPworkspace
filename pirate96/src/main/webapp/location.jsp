
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>위치및 교통이용페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src='js/jquery.js'></script>
<!--내부 스타일시트 적용-->
<style>
  /*메인페이지의 로고 이미지위치 지정*/

.main{ /*화면양쪽에 여백부여*/
    margin-left: 100px;
    margin-right: 100px;  
}


/* 헤더영역에 네비게이션 메뉴 배치*/

nav div li.login{ /*로그인 여부*/
    margin-right: 50px;
}
nav div li.logged-in::before{ /*로그인전*/
    content: "로그인";
}
nav div li.logged-in::after{ /*로그인이후*/
    content: "로그아웃";
}


*{
    margin: 0px; padding: 0px; 
}

/*전체 페이지가 가운데로 오도록 설정*/
#page{
    width: 820px;
    margin: 0px auto;
}

body,html{
    width: 100%;
    height: auto;
    bottom: 0;
}
  /*슬라이드 쇼 이미지 및 타이머설정영역*/
.slider{
    width: 550px;
    height: 350px;
    /*height: 300px; */
    position: relative;
    margin: 0 auto;
    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}
.slider input[type=radio]{
    display: none;
}
ul.imgs{
    padding: 0;
    margin: 0;
    list-style: none;    
}
ul.imgs li{
 
    position: absolute;
    right: 640px;
    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
    padding: 0;
    margin: 0;
}  
ul.imgs li img{
  width: 550px;
  height: 350px;   
}

.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 10px;
    z-index: 20;
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: olive;
    width: 20px;
    height: 20px;
    cursor: pointer;
}
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
</style>
<script>
</script>
</head>
<body>
  <form method="post">
  <jsp:include page="header.jsp" flush="true" />
      
      <div class="main"><!--화면양쪽에 여백부여-->
           <div>
           <br>
		   <h1 style="text-align:center;">유키 스터디카페</h1>
		   <br>
		   </div>      
          <h2 style="text-align: center;">#공간 소개 및 오시는 길#</h2>
          <br>
          <h3>*공간소개*</h3>
          <div class="container-fluid">
          <div class="row">
          <div class="col-sm-6" style="width:600px; height:300px; padding-right:0 auto;" >
          <img alt="스터디룸" src="../img/스터디룸이미지1.jpg"
          style="width:550px; height:350px;">
          </div>             
          <div class="col-sm-6" style="width:600px; height:300px; padding-right:0 auto;" >
          <div class="slider" style="position: absolute;">
              <input type="radio" name="slide" id="slide1" checked>
              <input type="radio" name="slide" id="slide2">
              <input type="radio" name="slide" id="slide3">
              <input type="radio" name="slide" id="slide4">
              <ul id="imgholder" class="imgs">
                  <li><img src="/img/1인스터디룸 이미지1.jpg"></li>
                  <li><img src="/img/2인스터디룸이미지2.jpg"></li>
                  <li><img src="/img/4인스터디룸이미지3.jpg"></li>
                  <li><img src="/img/대형스터디룸 이미지2.jpg"></li>
              </ul>
                 <div class="bullets">
                  <label for="slide1">&nbsp;</label>
                  <label for="slide2">&nbsp;</label>
                  <label for="slide3">&nbsp;</label>
                  <label for="slide4">&nbsp;</label>
                </div><!--불릿의 div-->
            </div><!--슬라이드의 div-->
            </div>
            </div><!-- ROW의 div -->
            </div><!-- fluid의 div -->
           <br><br>
          <!-- 영역 구분선 -->
            <br><br>  
            <h3>*위치*</h3> 
          <div class="container-fluid">
          <div class="row">   
          <!--구글지도- 위치변경시 src에 지도소스넣으면됨 -->
         <div class="col-sm-6" style="height: 280px; width:600px; padding-left:0 auto;">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3169.5564818596504!2d126.91905655129982!3d37.400319779730275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b60d1b8dde3f9%3A0xddc103e417d54cdc!2z7ZWY7J2066-465SU7Ja07Lu07ZOo7YSw7ZWZ7JuQIOyViOyWkey6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1679972863832!5m2!1sko!2skr" 
           width="450px" height="320px" allowfullscreen="false" style="border:0; margin: 0;"
           loading="lazy" referrerpolicy="no-referrer-when-downgrade">   
          </iframe>
          </div>
          <div class="col-sm-6" style="height: 280px; width:600px; padding-left:0 auto;">
          <hr style="border-top: 2px ridge skyblue;">
          <h4 style="text-align: center;">*유키 스터디카페는 !!!*</h4>
          <br>
          <p>하나, 1인실부터 단체공간까지 준비되어있는 스터디룸카페입니다.</p>
          <p>둘, 중간중간 간단한 스낵바와 커피를 즐길 수 있는 카페가 내부에 위치해 있습니다.</p>
          <p>셋, 다양한 교통수단을 가까이 이용할 수 있습니다.</p>
          <br>
          <hr style="border-top: 2px ridge skyblue;">
          </div>
          </div><!-- row의 div -->
          </div><!-- fluid의 div -->      
          <br><br>
          
       <!-- 영역구분선 -->
        
        <br>      
        <br>
        <div class="container-fluid">
        <h3>*주변정보*</h3>
        <div class="row">
        <div class="col-sm-6" style="width:400px; height:280px; padding-right:0 auto;">
          <img src="img/주변 주차장지도.png" alt="안양1번가 주변주차장지도" 
                      style="width: 450px; height: 320px;"> 
         </div>
         <br>            
            <div class="col-sm-6" style="width:400px; height:280px; padding-left: auto;">
              <hr style="border-top: 2px ridge skyblue;">
              <h4 style="text-align:center">*주변 교통정보*</h4>
             <p>1.근접한 전철역: 안양역</p>
             <p>2.근접한 버스정류장 
             <br>안양번가정류장 or 안양중앙시장(건너편)에서 하차
             <br>마을버스: 2,3-1,9,5-1번 버스등
             <br>일반버스: 5530,5626,5623,88,8,64,65,1-2,1,3번 버스등 
             <br>광역버스: M5556,M5333,333,3330번 버스등</p>             
             <p>3.주변 주차장: 일번가공영주차장,수암개복공영주차장
             <br>안양역 1,2 노상공영주차장,삼덕공원공영주차장등 </p>
             <hr style="border-top: 2px ridge skyblue;">
             </div>
          </div><!-- row의 div -->
          </div><!-- fluid의 div -->
          <br>
          </div><!-- main의 div -->                           
    </form>
  <!--footer영역-->
     <div style="width: 100%; height: 100px;"></div>
		<!--본문과 footer를 나누기위한 div-->
	<jsp:include page="footer.jsp" flush="true"/>
<!--footer영역끝-->
</body>
</html>



