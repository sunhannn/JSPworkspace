<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberVO"%>
<!--     회원가입 -->
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>

<style>

/* 더러운 css */
body {
	background-color: #f5f6f7;
}

small {
	color: #999;
}

label {
	font-weight: bold;
}

.cnum {
	width: 100%;
}

@media ( min-width : 992px) {
	.container, .container-lg, .container-md, .container-sm {
		max-width: 960px;
	}
	.col-md-8 {
		padding-right: 0px;
	}
	.col-md-4 {
		padding-left: 0px;
	}
}

@media ( min-width : 768px) {
	.container, .container-md, .container-sm {
		max-width: 720px;
	}
	.col-md-8 {
		padding-right: 0px;
	}
	.col-md-4 {
		padding-left: 0px;
	}
}

@media ( min-width : 576px) {
	.container, .container-sm {
		max-width: 540px;
	}
	.col-md-8 {
		padding-right: 13px;
	}
}

/* 폼요소들(입력요소들) 선택시(focus) 테두리에 그림자음영 처리 */
/*   .form-control:focus { */
/*     color: #495057; */
/*     background-color: #fff; */
/*     border-color: #29be03; */
/*     outline: 0; */
/*     box-shadow: 0 0 0 0.2rem rgba(0, 174, 87, 0.25); */
/*   } */
#joinbutton {
	background-color: #3B4A71;
	color: white;
	width: 100%;
	height: 50px;
}

input {
	border: none;
	background-color: #f5f6f7;
}

button {
	border: none;
	background-color: #3B4A71;
	color: white;
	border-radius: 5px;
}

.content_all {
	width: 95%;
	margin: 0 auto;
}

.title {
	font-size: 28px;
	font-weight: bold;
	width: 95%;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 20px;
}

hr {
	height: 3px;
	background: #000;
	border: 0;
	width: 95%;
}

.text_zone {
	width: 90%;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 100px;
}

.container {
	width: 900px;
}

#id {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
	margin-bottom: 6px;
}

#password {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
}

#passwordre {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
}

#name {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
}

#cnum {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
}

#email {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
}

#gender {
	border: none;
	background-color: #f5f6f7;
	border-bottom: solid 2px black;
	border-radius: 0px;
}

#addr {
	background-color: #3B4A71;
	border-radius: 5px;
	color: white;
}
</style>

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>

<body>
	<div class="content_all">
		<p class="title">회원가입</p>
		<hr>
		<div class="text_zone">

			<div class="container">

				<form class="needs-validation" action="memberJoinAction.go"
					name="frm" id="joinForm" method="post" novalidate>
					<!-- 			novalidate는 required를 무시하라는 의미 -->

					<div class="form-group">
						<label for="id">아이디</label> <input type="text"
							class="form-control" id="id" name="M_ID" required>
						<div class="valid-feedback">멋진 아이디네요!</div>
						<div class="invalid-feedback">필수 정보입니다.</div>
						<button type="button" id="idCheck">아이디 중복체크</button>
					</div>

					<div class="form-group">
						<label for="pwd">비밀번호</label> <input type="password"
							class="form-control" id="password" name="M_PW" required>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>

					<div class="form-group">
						<label for="passwordre">비밀번호 확인</label> <input type="password"
							class="form-control" id="passwordre" name="M_PW" required>
						<div class="valid-feedback"></div>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>


					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name="M_NAME" required>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>

					<div class="form-group">
						<label for="phone">휴대전화</label>
						<div class="row">
							<div class="col-md-8">
								<input type="tel" class="form-control mt-2" id="cnum"
									placeholder="전화번호 입력" name="M_PH" required>
							</div>

						</div>
					</div>
					<br>

					<div class="form-group">
						<label for="address">주소</label> <input type="text"
							id="sample4_postcode" placeholder="우편번호" name="	M_ADDR" required>
						<input type="button" onclick="sample4_execDaumPostcode()"
							id="addr" value="우편번호 찾기" name="M_ADDR"><br> <input
							type="text" id="sample4_roadAddress" placeholder="도로명주소"
							name="M_ADDR"> <input type="text"
							id="sample4_jibunAddress" placeholder="지번주소" name="M_ADDR">
						<span id="guide" style="color: #999; display: none"></span> <input
							type="text" id="sample4_detailAddress" placeholder="상세주소"
							name="M_ADDR"> <input type="text"
							id="sample4_extraAddress" placeholder="참고항목">
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>

					<div class="form-group">
						<label for="email">본인 확인 이메일</label> <input type="email"
							class="form-control" id="email" placeholder="Enter email"
							name="M_EMAIL" required>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>
					<br>

					<div class="form-group">
						<label for="gender">성별</label> <select class="form-control"
							id="gender" name="M_GENDER" required>
							<option value="">성별</option>
							<option>남</option>
							<option>여</option>
							<option>선택안함</option>
						</select>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>

					<div class="form-group">
						<button type="submit" class="from-control">가입하기</button>
					</div>
				</form>
			</div>
			<script>
	
(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    var forms = document.getElementsByClassName('needs-validation'); //load라는 이벤트를 준비후, needs-validation이라는 클래스의 요소를 가져와서
	    //form에 넣는다.
	    var validation = Array.prototype.filter.call(forms, function(form) {//array를 forms으로 변환? 한다.
	      form.addEventListener('submit', function(event) { //submit이벤트를 준비한다+.
	        if (form.checkValidity() === false) {//checkValidity는 현재 novalidate가 있기 때문에 false를 탐
	          event.preventDefault(); //submit의 기본 속성을 무시해라
	          event.stopPropagation(); //submit의 기본 속성을 무시해라
	        }
	        form.classList.add('was-validated'); //form요소에 있는 class속성에 was-validated라는 이름을 넣어라
	        valChk(event); 
	      }, false);
	    });
	  }, false);
	})();





function valChk(e){
// 	  e.preventDefault(); //위에서 막아준 거 한번 더 막아준거임 혹시나해서

	  var emailRegex = /^[-0-9A-Z_a-z]+@[A-Za-z]+.[A-Za-z]+$/, 
// 	  정규식패턴 /^시작해서 $/로 끝남
	  idRegex = /^[0-9A-Z_a-z]+$/,
	  phoneRegex = /^010\d{4}\d{4}$/,
// 	  d가 뭔 숫자 영어인거같은데 아무튼 4자리 숫자
	  id = $( "#id" ), 
// 	  id가 id인 input타입을 통째로 던짐
	  name = $( "#name" ),
	  email = $( "#email" ),
	  password = $( "#password" ),
	  passwordre = $( "#passwordre" ),
	  phone = $( "#cnum" );

	  //비밀번호 매칭 여부 조정
	  $("#passwordre, #password").on('keyup', function(){
		    checkMatch(password, passwordre);
		  });
	  //keyup키를 눌렀다뗐을때 매칭한 결과를 출력해라
	  
	  
	  var valid = true;
	  valid = valid && checkLength( id, "아이디는 4 ~ 16자 이상으로 입력해주세요.", 4, 16 );  
	  valid = valid && checkRegexp( id, idRegex,"아이디 입력 형식이 잘못되었습니다." );
	  valid = valid && checkLength( password, "비밀번호는 5~16자 이상으로 입력해주세요.", 5, 16 ); //5자리에서 16자리까지
// 	  valid = valid && checkMatch( password, passwordre);
	  valid = valid && checkMatch( password.val(), passwordre.val());
	  valid = valid && checkLength( name, "사용자이름", 3, 16 ); //3자리에서 16자리까지
	  valid = valid && checkRegexp( phone, phoneRegex,"전화번호 입력 형식이 잘못되었습니다." );
	  valid = valid && checkRegexp( email, emailRegex,"이메일 입력 형식이 잘못되었습니다." );
	//비밀번호 매칭
	function checkMatch(p, pre){
	  let pval = p;
	  let pvalre = pre;
	  
	  let res = true;

	  if(pval.val() == pvalre.val()){
		  pvalre.nextAll("div.valid-feedback").text("비밀번호가 일치합니다.").show();
		   pvalre.nextAll("div.invalid-feedback").hide();
	   
	  }else{
		    pvalre.nextAll("div.invalid-feedback").text("비밀번호가 일치하지 않습니다.").show();
		    pvalre.nextAll("div.valid-feedback").hide();
		    res = false;
		  }

	  return res;

	}
	
	

//정규식 일치 여부 확인
	  function checkRegexp( o, regexp, n ) {
	    let cnt = $("#"+o.attr('id')+" ~ div.invalid-feedback").length; //$("#id")의 자식인 div의 invalid-feedback => 1
	   
	    
	    if ( !( regexp.test( o.val() ) ) ) {      
	        if(cnt == 0){
	           o.closest("div.row").nextAll("div.invalid-feedback").eq(0).text(n).show();
	           o.closest("div.row").nextAll("div.valid-feedback").eq(0).hide();
	        }else{
	           o.nextAll("div.invalid-feedback").eq(0).text(n).show();
	           o.nextAll("div.valid-feedback").eq(0).hide();
	        }
	        return false;
	        
	      } else {
	        if(cnt == 0){
	          o.closest("div.row").nextAll("div.invalid-feedback").eq(0).hide();
	        }else{
	          o.nextAll("div.invalid-feedback").eq(0).hide();
	        } 
	        return true;
	      }
	    }

	  function checkLength( o, n, min, max ) { 
		    let cnt = $("#"+o.attr('id')+" ~ div.invalid-feedback").length;
		    if ( o.val().length > max || o.val().length < min ) {
		      $("#"+o.attr('id')+" ~ div.invalid-feedback").eq(0).text(n).show();
		      $("#"+o.attr('id')+" ~ div.valid-feedback").eq(0).hide();
		      return false;
		    } else {
		      $("#"+o.attr('id')+" ~ div.invalid-feedback").hide();
		      return true;
		    }
		  }
	  
	  
	  if(valid)
	    e.target.submit();
	  
	}
	  
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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


$(()=>{
   $("#idCheck").click(function(){
      $.ajax({
         url : "loginCheck.go",   //컨트롤러 주소래
         type : "post",   //form태그의 method랑 같은거
         data : { idJoonbok: $("#id").val() },   //request.setParameter에 첫번째 매개변수가 seungmu, 두번째매개변수가 보낼값
         cache : false,   //기존 ajax 기록삭제, 캐쉬에
         success : function(idJoonbok){   //아약스처리가 잘됫을때 나타날곳
            console.log('success');
            alert(idJoonbok.id + '는 ' + idJoonbok.str);
         },
         error : function(){   //아약스처리 실패시 나타날곳
            alert('error');
         }
      });            
   });
});









</script>
		</div>
</body>

</html>