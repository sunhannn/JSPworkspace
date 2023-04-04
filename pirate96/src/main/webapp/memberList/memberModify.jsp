<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberVO article = (MemberVO) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width,initial-scale=1">
<title>회원 목록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<style>
body {
	background-color: #f5f6f7;
}

.content_all {
	width: 80%;
	margin: 0 auto;
}

.content_all section {
	padding-bottom: 15px;
}

.write_title {
	font-size: 36px;
	font-weight: bold;
	padding: 30px 0;
	border-bottom: 2px solid #000;
}

.text_zone {
	width: 75%;
	margin: 0 auto;
}

.btn_zone {
	width: 30%;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 30px;
}

.small_btn {
	background-color: #aacef2;
	border: none;
	border-radius: 5px;
	height: 50px;
	width: 100px;
}

.small_btn:hover {
	background-color: #75b2f0;
}

.write_table {
	width: 70%;
	margin: 0 auto;
	margin-top: 50px;
	margin-left: 250px;
}

.td_sub {
	vertical-align: middle;
	text-align: right;
	font-size: 0.8em;
	font-weight: bold;
	padding-right: 20px;
	border-right: 1px solid #ccc;
}

.td_content {
	padding-left: 20px;
}

.write_table td {
	padding-bottom: 30px;
}

label {
	margin: 0;
	display: inline-block;
}

.modi_input {
	border: none;
	border: 1px solid #d9d8d7;
	padding: 5px 0;
	padding-left: 20px;
	width: 220px;
}

.modify_select {
	border: 1px solid #d9d8d7;
	width: 175px;
	padding: 5px;
	padding-left: 20px;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="content_all">
		<section>
			<p class="write_title">회원 수정</p>
			<div class="text_zone">
				<form action="memberModifyPro.go" method="post" name="boardform">
					<input type="hidden" name="M_ID" value="<%=article.getM_ID()%>" />
					<table class="write_table">
						<tr>
							<td class="td_sub"><label for="M_ID">아이디</label></td>
							<td class="td_content"><input class="modi_input" type="text"
								name="M_ID" id="M_ID" value="<%=article.getM_ID()%>" DISABLED /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_NAME">이름</label></td>
							<td class="td_content"><input class="modi_input"
								name="M_NAME" type="text" id="M_NAME"
								value="<%=article.getM_NAME()%>" required="required" /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_PH">핸드폰 번호</label></td>
							<td class="td_content"><input class="modi_input" id="M_PH"
								name="M_PH" value=<%=article.getM_PH()%> required="required" /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_ADDR">주소</label></td>
							<td class="td_content"><p>기존 주소: <%=article.getM_ADDR()%></p>
							<input type="text" class="modi_input" id="sample4_postcode" placeholder="우편번호" name="M_ADDR1" style=" margin-bottom:20px;"required>
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="color:white; background:#3B4A71; border-radius:0.3em;"><br> 
							<input type="text"  class="modi_input" id="sample4_roadAddress" placeholder="도로명주소" name="M_ADDR3" style="margin-bottom:20px;">
							<input type="text" class="modi_input" id="sample4_jibunAddress" placeholder="지번주소" name="M_ADDR4" style="margin-bottom:20px;">
							<span id="guide" style="color: #999; display: none" ></span> 
							<input type="text" class="modi_input" id="sample4_detailAddress" placeholder="상세주소" name="M_ADDR5" style="margin-bottom:20px;">
							<input type="text" class="modi_input" id="sample4_extraAddress" placeholder="참고항목" style=" margin-bottom:20px;">
							<div class="invalid-feedback">필수 정보입니다.</div>
							</td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_EMAIL">이메일</label></td>
							<td class="td_content"><input class="modi_input"
								id="M_EMAIL" name="M_EMAIL" value=<%=article.getM_EMAIL()%>
								required="required" /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_GENDER">성별</label></td>
							<td class="td_content"><input class="modi_input"
								id="M_GENDER" name="M_GENDER" value=<%=article.getM_GENDER()%> />
							</td>
						</tr>

					</table>
					<br>
					<div class="btn_zone">
						<button type="button" class="small_btn"
							onClick="location.href='memberList.go'">목록으로</button>
						<button type="submit" class="small_btn" id="btn1">수정</button>
					</div>
				</form>
			</div>
		</section>

	</div>
	<script>
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }

	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';

	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}
	</script>
	
	
	<div class="footer">
		<%@ include file="/footer.jsp"%>
	</div>