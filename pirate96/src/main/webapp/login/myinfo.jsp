<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 내정보확인페이지 -->
<% Member member  = (Member) request.getAttribute("member"); %>
<table>
<tr><th>아이디</th><th>비번</th><th>이름</th><th>전화번호</th><th>주소</th><th>이메일 주소</th><th>성별</th></tr>
<tr><td><%=member.getM_ID() %></td><td><%=member.getM_PW() %></td><td><%=member.getM_NAME() %></td>
<td><%=member.getM_PH() %></td>
<td><%=member.getM_ADDR() %></td>
<td><%=member.getM_EMAIL() %></td>
<td><%=member.getM_GENDER() %></td></tr>
</table>
</body>
</html>