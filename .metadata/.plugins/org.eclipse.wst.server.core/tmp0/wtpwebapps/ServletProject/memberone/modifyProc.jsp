<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.memberone.*"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
    <jsp:useBean id="dao" class="com.memberone.StudentDAO"/>
    <jsp:useBean id="vo" class="com.memberone.StuderntVo"/>
    <jsp:setProperty name="vo" property="*"/>
    
    <!--이클립스 vo에 있는 모든 세터메소드를 활용가능?-->
    
 <%
  String loginID= (String)session.getAttribute("loginID");
  vo.setId(loginID);
  dao.updateCheck(vo);
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정완료</title>
</head>
<meta http-equiv="Refresh" content="3; url=login.jsp">
<body>
<div align="center">
<font size="5" face="궁서체">
입력하신 내용대로 <b>회원정보가 수정되었습니다.</b><br><br>
3초후에 Login Pag로 이동합니다.

</font>
</div>

</body>
</html>