<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function loadDoc() {
		var xhttp = new XMLHttpRequest(); // 비동기통신에 대한 정보를 담을 객체 생성
		var currentState = "";

		if (this.readyState == XMLHttpRequest.UNSET)
			currentState += "XMLHttpRequest 객체의 현재 상태는 UNSET(0)입니다. - XMLHttpRequest 객체가 생성됨.<br>";

		xhttp.onreadystatechange = function() {
			switch (this.readyState) {
			case XMLHttpRequest.UNSET:
				currentState += "XMLHttpRequest 객체의 현재 상태는 UNSET(0)입니다."
						+ "-XMLHttpRequest 객체가 생성됨. <br>";
				break;
			case XMLHttpRequest.OPENED:
				currentState += "XMLHttpRequest 객체의 현재 상태는 HEADERS_RECEIVED(2) 입니다."
						+ "-모든 요청에 대한 응답이 도착함. <br>";
				break;
				
			case XMLHttpRequest.LOADING:
				currentState += "XMLHttpRequest객체의 현재 상태는 LOADING(3) 입니다. - 요청한 데이터를 처리 중 <br>";
				break;
			case XMLHttpRequest.DONE:
				currentState += "XMLHttpRequest객체의 현재 상태는 done(4) 입니다. - 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨. <br>";
				break;
			}
			document.getElementById("status").innerHTML = currentState;

			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("demo").innerHTML = xhttp.responseText;
			}

			//  형식 : open(전달 방식, URL주소, 동기여부);
			// xhttp.openm("GET","ajax_info.txt",true);
			xhttp.open("GET", "Gesipan/test.do", true);

			// send()메소드는 작성된 Ajax 요청을 서버로 전달한다.
			xhttp.send();

		}

		//                 function loadDoc(){
		// $("#demo").load("ajax_info.txt");
		// $("#demo").load("Gesipan/test.do")

		//                 }

	}
</script>
</head>

<body>
	<div id="status"></div>
	<br>
	<hr>
	<br>

	<div id="demo">

		<h2>The XMLHttpRequest Object</h2>
		<button type="button" onclick="loadDoc()">Change Content</button>

	</div>



</body>

</html>