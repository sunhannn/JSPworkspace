<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String namae = request.getParameter("name");
String ide = request.getParameter("id");
String ansyo = request.getParameter("password");
String nen = request.getParameter("year");
String getsu = request.getParameter("mon");
String nichi = request.getParameter("date");
String seibetsu = request.getParameter("gender");
String meiru = request.getParameter("email");
String ketai = request.getParameter("phone");


%>
<p>아이디는 <%=ide %>입니다.</p>
<p>비밀번호는 <%=ansyo %>입니다.</p>
<p>이름은 <%=namae %>입니다.</p>
<p>생년월일은 <%=nen %>년<%=getsu %>월<%=nichi %>일 입니다.</p>
<p>성별은 <%=seibetsu %>입니다.</p>
<p>이메일은 <%=meiru %>입니다.</p>
<p>전화번호는 <%=ketai %>입니다.</p>






</body>
</html>