<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.MemberVO" %>
<!--     회원가입 -->
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
  <style>
    body {background-color: #f5f6f7;}
    h2 {
      color: #03c75a;
      font-weight: bolder;
      font-size: 50pt;
      text-align: center;
      letter-spacing: 5px;
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

    @media (min-width: 992px) {
      .container, .container-lg, .container-md, .container-sm {
        max-width: 960px;
      }
      .col-md-8 {
        padding-right: 0px;
      }
      .col-md-4{
        padding-left: 0px;
      }
    }

    @media (min-width: 768px) {
      .container, .container-md, .container-sm {
        max-width: 720px;
      }
      .col-md-8 {
        padding-right: 0px;
      }
      .col-md-4{
        padding-left: 0px;
      }
    }

    @media (min-width: 576px) {
      .container, .container-sm {
        max-width: 540px;
      }
      .col-md-8 {
        padding-right: 13px;
      }
    }

  /* 폼요소들(입력요소들) 선택시(focus) 테두리에 그림자음영 처리 */
  .form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #29be03;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(0, 174, 87, 0.25);
  }
  </style>
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>

<body>

  <div class="container">
    <h2 class="mt-5 mb-3">STUDY CAFE JOIN</h2>
    <form class="needs-validation" action ="memberJoinAction.go" name="frm">
     
      <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" name="M_ID" required>
        <button type="button" id="idchk">아이디 중복체크</button>
        <span id="result"></span>
        
        <div class="valid-feedback">멋진 아이디네요!</div>
        <div class="invalid-feedback">필수 정보입니다.</div>
      </div>

      <div class="form-group">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" id="password" name="M_PW" required>
        <div class="invalid-feedback">필수 정보입니다.</div>
      </div>
      
      <div class="form-group">
        <label for="pwd">비밀번호 확인</label>
        <input type="password" class="form-control" id="passwordre" name="M_PW" required>
        <div class="invalid-feedback">필수 정보입니다.</div>
      </div>


      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" class="form-control" id="name" name="M_NAME" required>
        <div class="invalid-feedback">필수 정보입니다.</div>
      </div>
      
      <div class="form-group">
        <label for="phone">휴대전화</label>
        <select class="form-control" id="phone" name="M_PH" required>
          <option value="+82">대한민국 +82</option>
        </select>
        <div class="row">
          <div class="col-md-8"><input type="tel" class="form-control mt-2" id="cnum" placeholder="전화번호 입력" name="cnum" required>
          </div>
          <div class="col-md-4"><button type="button" class="btn btn-success mt-2 cnum">인증번호 받기</button>
          </div>
        </div>
        <input type="text" class="form-control mt-2" disabled id="cnumip" placeholder="인증번호를 입력하세요." name="cnumip">
        <div class="invalid-feedback">필수 정보입니다.</div>
      </div><br>
      
	<div class="form-group">
	<label for="address">주소</label>
      <input type="text" id="sample4_postcode" placeholder="우편번호" name ="	M_ADDR" required>
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" name ="M_ADDR" ><br>
	<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name ="M_ADDR">
	<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name ="M_ADDR">
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" id="sample4_detailAddress" placeholder="상세주소" name ="M_ADDR">
	<input type="text" id="sample4_extraAddress" placeholder="참고항목">
	<div class="invalid-feedback">필수 정보입니다.</div>
	</div>

      <div class="form-group">
        <label for="email">본인 확인 이메일<small>(선택)</small></label>
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="M_EMAIL" required>
        <div class="invalid-feedback">필수 정보입니다.</div>
      </div><br>

      <div class="form-group">
        <label for="gender">성별</label>
        <select class="form-control" id="gender" name="M_GENDER" required>
          <option value="">성별</option>
          <option>남</option>
          <option>여</option>
          <option>선택안함</option>
        </select>
        <div class="invalid-feedback">필수 정보입니다.</div> 
      </div>

      <div class="form-group">
      <input type="submit" value="회원가입" class="btn btn-success">
			
       
      </div>
    </form>
  </div>
<script>
(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
        valChk(event);
      }, false);
    });
  }, false);
})();


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



// function valChk(e){
//   e.preventDefault();

//   var emailRegex = /^[-!#$%\s'*+./0-9=?A-Z^_a-z{|}~]+@[A-Za-z{|}~]+.[A-Za-z]+$/,
//   idRegex = /^[0-9A-Z_a-z]+$/,
//   phoneRegex = /^010\d{4}\d{4}$/,
  
//   id = $( "#id" ),
//   name = $( "#name" ),
//   email = $( "#email" ),
//   password = $( "#password" ),
//   passwordre = $( "#passwordre" ),
//   phone = $( "#cnum" );

//   //입력 년,월에 따라 일 수 max값 조정
//   $("#mon, #year").on('change', function(){
//       let dmax = 31;
//       console.log(mon.val());
//       if(!(year=='' || year.val() < 1900) ){
//           switch(Number(mon.val())){
//           case 4: case 6: case 9: case 11:
//             dmax = 30; break;
//           case 2: 
//             if(year%4==0) dmax = 29;
//             else dmax = 28;
//         }
//       }
//       console.log('날짜: ',dmax);
    
//       $("#date").attr("max", dmax);
//   });

//   //비밀번호 매칭 여부 조정
//   $("# #password,passwordre").on('keyup', function(){
//     checkMatch(password, passwordre);
//   });

//   var valid = true;
//   valid = valid && checkLength( id, "아이디는 4 ~ 16자 이상으로 입력해주세요.", 4, 16 );
//   valid = valid && checkRegexp( id, idRegex,"아이디 입력 형식이 잘못되었습니다." );
//   valid = valid && checkRegexp( email, emailRegex,"이메일 입력 형식이 잘못되었습니다." );
//   valid = valid && checkRegexp( phone, phoneRegex,"전화번호 입력 형식이 잘못되었습니다." );
//   valid = valid && checkLength( password, "비밀번호는 5 ~ 16자 이상으로 입력해주세요.", 5, 16 );
//   valid = valid && checkMatch( password, passwordre);
//   valid = valid && checkLength( name, "사용자이름", 3, 16 );

  


// //비밀번호 매칭
// function checkMatch(p, pre){
//   let pval = p;
//   let pvalre = pre;

//   let res = true;

//   if(pval.val() == pvalre.val()){
//     pvalre.nextAll("div.valid-feedback").text("비밀번호가 일치합니다.").show();
//     pvalre.nextAll("div.invalid-feedback").hide();
//   }else{
//     pvalre.nextAll("div.invalid-feedback").text("비밀번호가 일치하지 않습니다.").show();
//     pvalre.nextAll("div.valid-feedback").hide();
//     res = false;
//   }

//   return res;

// }

// //정규식 일치 여부 확인
//   function checkRegexp( o, regexp, n ) {
//     let cnt = $("#"+o.attr('M_ID')+" ~ div.invalid-feedback").length;
    
//     if ( !( regexp.test( o.val() ) ) ) {      
//       if(cnt == 0){
//          o.closest("div.row").nextAll("div.invalid-feedback").eq(0).text(n).show();
//          o.closest("div.row").nextAll("div.valid-feedback").eq(0).hide();
//       }else{
//          o.nextAll("div.invalid-feedback").eq(0).text(n).show();
//          o.nextAll("div.valid-feedback").eq(0).hide();
//       }
//       return false;
//     } else {
//       if(cnt == 0){
//         o.closest("div.row").nextAll("div.invalid-feedback").eq(0).hide();
//       }else{
//         o.nextAll("div.invalid-feedback").eq(0).hide();
//       } 
//       return true;
//     }
//   }

//   function checkLength( o, n, min, max ) { 
//     let cnt = $("#"+o.attr('M_ID')+" ~ div.invalid-feedback").length;
//     if ( o.val().length > max || o.val().length < min ) {
//       $("#"+o.attr('M_ID')+" ~ div.invalid-feedback").eq(0).text(n).show();
//       $("#"+o.attr('M_ID')+" ~ div.valid-feedback").eq(0).hide();
//       return false;
//     } else {
//       $("#"+o.attr('M_ID')+" ~ div.invalid-feedback").hide();
//       return true;
//     }
//   }

//   if(valid) e.target.submit();

//

$(function(){
	$('#idchk').click(function(){
		$.ajax({
			url : "loginCheck.me",
			type : "post",
			data : {uid: document.frm.M_ID.value}, 
			cache: false,
			success : function(res){
				console.log('success');
					alert(res.map.M_ID + '는' + res.map.str);
					},
			error : function(){
					alert('error');
			}
		});
	});
});



</script>
</body>

</html>