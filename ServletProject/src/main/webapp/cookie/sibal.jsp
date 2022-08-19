<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.logon.LoginDBBean" %>
<% request.setCharacterEncoding("utf-8");%>

<%
      //String
      String id= request.getParameter("id");
      String pass=request.getParameter("passwd");
      
      LoginDBBean manager = LoginDBBean.getInstance();
      
      int check= manager.userCheck(id, pass);
      
      if(check== 1){//로그인성공
       Cookie cookie = new Cookie("memId",id);
      cookie.setMaxAge(2*60);
      response.addCookie(cookie);
      response.sendRedirect("cookieLoginConfirm.jsp");
      
    	  
    	  
      }else if(check == 0){//아이디는 존재하나 비밀번호오류
                        
%>
<script type="text/javascript">
alert("비밀번호가 틀렸습니다.");
history.go(-1);
</script> 
<%} else{//아이디가 존재하지않는 경우 %>   
    <script type="text/javascript">
alert("아이디가 존재하지 않습니다.");
history.go(-1);
</script>
<%} %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>