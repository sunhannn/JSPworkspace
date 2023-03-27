
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="vo.MemberVO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 마이페이지 -->
  <%
    
        Enumeration enumeration = session.getAttributeNames();
        int i = 0;
        while(enumeration.hasMoreElements()) {
            i++;
            
            String sName = enumeration.nextElement().toString();
            String sValue = (String)session.getAttribute(sName);
            
            if(sValue != null) {
            	out.println(sValue + "님, 안녕하세요<br/>");
        }
            else {
            	out.println("일치하는 데이터가 존재하지 않습니다."); 
            	}
            }
    %>
    <form action="./myinfo.go">
    <button type="submit" >내정보 확인</button>
</form>
<form action ="updatepage.jsp">
<input type="submit" value="내정보 수정">
</form>

<form action ="../memberDeleteAction.go"  >

<input type="submit" value="회원탈퇴">
</form>
<form action="memberLogout.go">
<input type="submit" value="로그아웃">
</form>
<form action="../revList.go">

<button type="submit">
예약 목록 보기
</button>

</form>


<form action="../mainPage/main.jsp">
<button type="submit">
메인페이지로 가기
</button>

</form>

 
</body>
</html>
