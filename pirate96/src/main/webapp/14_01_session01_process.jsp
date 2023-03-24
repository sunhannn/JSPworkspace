<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		if(user_id.equals("admin") && user_pw.equals("1234")){
			session.setAttribute("userID",user_id);
			session.setAttribute("userPW",user_pw);	
			out.println("세션 설정이 성공했습니다<br>");
			out.println(user_id + "님 환영합니다");
		} else {
			response.sendRedirect("14_01_session01.jsp?no=1");
		}
	%>
	<%
	if(user_id.equals("admin")){%>
	 <a href="boardWriteForm.go" id="write">게시판글쓰기</a> 
	<%}%>
	<br>
	
</body>
</html>