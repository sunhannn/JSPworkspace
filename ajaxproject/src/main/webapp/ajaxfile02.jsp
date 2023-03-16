<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
            $(function () {
                $("button").click(function () {
                    $.ajax({
                        url: "loginCheck"
type: "post",
                        data: { id: document.frm.id.value },
                        cache: false,
                        success: function (data) {
                            console.log('success');
                            alert(data.map.id + '는' + data.map.str);

                        },
                        error: function () {
                            alert('error');
                        }


                    })


                })



            })




        </script>

</head>

<body>
	<form name="frm">
		<input type="text" name="id">
		<button type="button">아이디 중복체크</button>


	</form>




</body>

</html>