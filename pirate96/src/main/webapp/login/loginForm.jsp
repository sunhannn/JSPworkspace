<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
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
  <script>
  let str = '<%=request.getParameter("error")%>';
//   alert(str);
  if( !(str== ''|| str== 'null')){alert('로그인에 실패했습니다.');}
  </script>
</head>
<body>
<section id = "loginformArea">
<form name="loginform" action="memberLoginAction.me" method="post">
<div class="container">
<h2>로그인</h2>
	
<div class="form-group">
<label for="id">아이디</label>
        <input type="text" class="form-control" id="id" name="M_ID" >
</div>
	<div class="form-group">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" id="password" name="M_PW" >
        </div>
        <div class="form-group">
			<input type="submit" value="로그인" class="btn btn-success" >
			<button type="button" onclick="location.href='joinForm.jsp'" class="btn btn-success">회원가입</button>
</div>
</div>
</form>
</section>
</body>
</html>