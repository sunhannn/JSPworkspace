<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 성공</title>
</head>
<body>
<%
    
        Enumeration enumeration = session.getAttributeNames();
        int i = 0;
        while(enumeration.hasMoreElements()) {
            i++;
            
            String sName = enumeration.nextElement().toString();
            String sValue = (String)session.getAttribute(sName);
            
            if(sValue != null) {
            	out.println(sValue + "님, 환영합니다.<br/>");
        }
            else {
            	out.println("일치하는 데이터가 존재하지 않습니다."); 
            	}
            }
    %>

<a href="mypage.jsp">마이페이지</a>

</body>
</html>