<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width", initial-scale="1">
<title>Insert title here</title>

<%-- 관리자 아이디(admin)일때만 글쓰기 가능하도록
<% if(session.getAttribute("sessionId").equals("admin")) { %>
<a href="boardWriteForm.go">게시판글쓰기</a>
<% } %>
--%>
<%
// 	↓ alert창 뜨게하기 (14_01_session01_process 페이지에서 쿼리스트링으로 받으면 처리하기)
	if(request.getParameter("no") != null){
		out.println("<script>alert('세션 설정이 실패했습니다.');</script>");
	}
%>
	<form action="14_01_session01_process.jsp" method="POST">
		<p> 아이디: <input type="text" name="id"></p>
		<p> 비밀번호: <input type="text" name="passwd"></p>
		<p> <input type="submit" value="전송"></p>
	</form>
</body>
</html>