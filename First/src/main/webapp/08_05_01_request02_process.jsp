<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="memberBean" class="com.dto.MemberBean"></jsp:useBean>
	<%-- <jsp:setProperty property="*" name="memberBean"/> --%>
<!-- 	memberBean.setId(request.getParameter("user_id")); -->
	<jsp:setProperty property="id" name="memberBean" param="user_id" />
	<jsp:setProperty property="name" name="memberBean" param="name" />

	아이디 :
	<jsp:getProperty property="id" name="memberBean" /><br> 아이디 :
	<jsp:getProperty property="name" name="memberBean" /><br> 아이디 :
	<jsp:getProperty property="hobby" name="memberBean" /><br> 요청정보
	컨텐츠타입 =
	<%=request.getContentType()%><br>
	<small style="color: red">클라이언트가 전송한 요청 정보 (post로 보낸 데이터만)의 콘텐츠
		타입을 구함.</small>
	<%
	String[] hobby = memberBean.getHobby();
	for (int i = 0; i < hobby.length; i++) {
		if (hobby[i] != null) {
			out.write(hobby[i]);
			if (i != (hobby.length - 1))
		out.write(", ");

		} else {
			if (i == 0)
		out.write("입력된 취미 정보가 확인되지 않습니다.");
		}

	}
	%>


</body>
</html>