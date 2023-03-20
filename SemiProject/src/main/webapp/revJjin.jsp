<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>방별로 예약하기</title>
    <link rel="stylesheet" href="revGo.css">
    <link rel="stylesheet" href="../jq/js/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../jq/js/jquery-ui.js"></script>
</head>

<body>
    <div class="container-fluid">
        <h3 style="text-align: center;">고잉메리호 스터디카페 예약</h3>
        <p style="font-size: 16px; font-weight: bold; text-align: center;">다음 주의사항을 꼭 지켜주세요!</p>
    </div>
    <div class="container-fluid" style="text-align: center;">

        <p>♣ 취식물은 마실 것만 가능합니다.</p> <br>
        <p>♣ 다음 사람을 위해 정리하고 나가주세요.</p> <br>
        <p>♣ 예약 시간을 준수해주세요.</p><br>
        <p>♣ 예약은 1시간 단위로 가능합니다.</p><br>

    </div>

    <div class="container-fluid" style="text-align: center;">
        <form action="rev.go">
            <div class="date">
                <p style="font-size: 15px; font-weight: bold;">예약 일자</p><br>
                <input type="date" name="currentDate" id="currentDate" value="today">
            </div><br>
            <div class="start">
                <p style="font-size: 15px; font-weight: bold;">시작 시간</p><br>
                <select name="start" id="startTime">
                    <option value="1">01:00</option>
                    <option value="2">02:00</option>
                    <option value="3">03:00</option>
                    <option value="4">04:00</option>
                    <option value="5">05:00</option>
                    <option value="6">06:00</option>
                    <option value="7">07:00</option>
                    <option value="8">08:00</option>
                    <option value="9">09:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <option value="22">22:00</option>
                    <option value="23">23:00</option>
                    <option value="24">24:00</option>
                </select>
            </div><br>
            <div>
                <p style="font-size: 15px; font-weight: bold;">종료 시간</p>
                <select name="end" id="endTime">
                    <option value="1">01:00</option>
                    <option value="2">02:00</option>
                    <option value="3">03:00</option>
                    <option value="4">04:00</option>
                    <option value="5">05:00</option>
                    <option value="6">06:00</option>
                    <option value="7">07:00</option>
                    <option value="8">08:00</option>
                    <option value="9">09:00</option>
                    <option value="10">10:00</option>
                    <option value="11">11:00</option>
                    <option value="12">12:00</option>
                    <option value="13">13:00</option>
                    <option value="14">14:00</option>
                    <option value="15">15:00</option>
                    <option value="16">16:00</option>
                    <option value="17">17:00</option>
                    <option value="18">18:00</option>
                    <option value="19">19:00</option>
                    <option value="20">20:00</option>
                    <option value="21">21:00</option>
                    <option value="22">22:00</option>
                    <option value="23">23:00</option>
                    <option value="24">24:00</option>
                </select>



            </div><br>
            <div>
                <p style="font-size: 15px; font-weight: bold;">원하시는 방 번호를 골라주세요.</p>
                <select name="roomNum" id="roomNum">
                    <option value="1">1번방</option>
                    <option value="2">2번방</option>
                    <option value="3">3번방</option>
                    <option value="4">4번방</option>
                    <option value="5">5번방</option>
                    <option value="6">6번방</option>

                </select>


            </div>
            <br><br>
            <hr>
            <button type="submit">예약하기</button>

        </form>
    </div>
    <!-- 디폴트 오늘날짜 JS -->
    <script>
        document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;


    </script>


</body>

</html>