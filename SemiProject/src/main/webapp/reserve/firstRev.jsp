<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 페이지1</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./main.css">
    <style>
        footer {
            width: 100%;
            /*헤더와 같은 사이즈*/
            height: 100px;
            /*footer의 높이*/
            color: navy;
            left: 0;
            background-color: #f5f6f7;
            bottom: 0;
            /*하단에 여백없이*/
            padding: 0;
            margin-top: 50px;
            /*footer 위쪽여백설정*/
            margin: 0;
        }

        #rev {
            width: 100%;
            height: 100%;
            color: white;
            border: 0px;
            background-color: rgb(64, 111, 134);
        }

        li {
            font-family: "궁서";
            font-size: 16px;

        }



        .roomNum {
            font-size: 16px;
            font-weight: bold;
        }

        .revBtn {
            display: block;
            text-align: center;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body style="background-color: #f5f6f7;">
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
                    <li><a href="#" onclick="location.href='firstRev.jsp'">스터디룸 예약</a></li>
                </ul>
            </nav>
        </header>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <!-- 예약 칸 -->
    <div class="container-fluid">
        <h2 style="color: #4682b4;">스터디룸 예약</h2>
        <hr>
    </div>
    <br>
    <div class="container-fluid">

        <h2 style="font-weight: bold; color: #4682b4;">홈페이지 예약제(전화예약
            불가)</h2>
        <br>
        <hr>
    </div>
    <br>
    <br>
    <!-- 예약 버튼 -->
    <div class="container-fluid">
        <p style="font-size: 14px;">▼ 아래버튼을 클릭하시면 예약페이지로 이동할 수 있습니다.</p>
        <form action="revPage.jsp" id="frm">
            <div class="rev__btn" style="height: 90px; text-align: center;">
                <button onclick="btn()" id="rev">스터디룸 예약하러 가기 ▶</button>
            </div>
        </form>
    </div>
    <br>
    <!-- 예약시 주의사항 리스트 -->
    <div class="container-fluid">
        <ul>
            <li>예약 후 별도 절차없이 예약시간 현장 방문하여 이용하시면 됩니다.</li>
            <li>"공부하고 배우는 것은 평생이며, 그러한 것을 거부하는 것은 늙음과 같습니다." - 리챌라이트</li>
            <li>"누구든지 처음에는 아무 것도 몰랐다. 그들이 성공한 이유는, 그들이 항상 배우고 성장하며 계속 노력했기 때문이다." - 존 C. 맥스웰</li>
        </ul>

    </div>

    <footer class="footer">
        <hr style="border: 3px solid navy;"><br>
        <p>현재 사이트는 교육용으로 제작된 웹사이트로 실제로는 사용불가능합니다.</p>
        <p>카피라이터: 1조 평균나이 96년생</p>
        <p>팀장: 한상현, 부팀장: 박수빈, 팀원: 김선찬, 송채은, 윤지원</p>
    </footer>





    <script>
        window.onload = function () {
            document.getElementById('btn').onclick = function () {
                document.getElementById('frm').submit();
                return false;
            };
        };
    </script>

</body>

</html>