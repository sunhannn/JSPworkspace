<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	width: 60%;
	margin: 0 auto;
	padding: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<form name=frm action="12_01_validation_process.jsp" method="post">
		<fieldset>
			<legend>exec()메소드 사용</legend>
			<input type="text" name="itt" value="java server Pages" required><br>
			<input type="button" value="전송" onclick="checkForm()">
		</fieldset>
	</form>
</body>

<script>
	function checkForm() {
		var regExp = /Java server/i;
		//Java server문자열이 포함되었는지 여부 판단. i:대소문자 구분없이
		//var regExp= new RegExp('Java server','i');
		var str = document.frm.itt.value;
		//var result = regExp.exec(str);
		var result = regExp.test(str);
		alert(result);
		if (result == false)
			return false;
		else {
			document.frm.submit();
		}
	}
</script>
</html>