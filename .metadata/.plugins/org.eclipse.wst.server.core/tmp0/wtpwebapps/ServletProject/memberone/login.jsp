<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
   String loginID= (String)session.getAttribute("loginID");     
  %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<%
  if(loginID != null){//로그인 되었을떄 화면출력
%>
<table width="300" border="1">
    <tr>
    <td colspan="3" align="center"><%=loginID %>님 환영합니다.</td>
    
    </tr>
    
    <tr>
    <td width="100" align="center">
    <a href="modifyForm.jsp">정보수정</a>       
     </td>
      <td width="100" align="center">
    <a href="deleteForm.jsp">회원탈퇴</a>
      </td>
      <td width="100" align="center">
    <a href=" logout.jsp">로그아웃</a>
    </td>
    
    </tr>      
</table>
<%}else { %>

<form action="loginproc.jsp" method="post">
<table width="300" border="1">
<tr>
  <td colspan="2" align="center">회원로그인</td>
</tr>

<tr>
  <td width="100" align="right">아이디</td>
  <td width="200">&nbsp;&nbsp;
    <input type="text" name="id" size="20">
    </td>
</tr>
<tr>
  <td width="100" align="right">비밀번호</td>
  <td width="200">&nbsp;&nbsp;
    <input type="password" name="pass" size="20">
    </td>
</tr>
<tr>
  <td colspan="2" align="center">
    <input type="submit" value="로그인">&nbsp;&nbsp;
    <input type="button" value="회원가입"
    onclick="javascript:window.location='regForm.jsp'">
    </td>
</tr>
</table>
</form>
<%} %>
</body>
</html>