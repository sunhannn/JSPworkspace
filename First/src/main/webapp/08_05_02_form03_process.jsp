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
	<%
	String id = request.getParameter("id");
	String ansyo = request.getParameter("passwd");
	String namae = request.getParameter("name");
	String ketai1 = request.getParameter("phone1");
	String ketai2 = request.getParameter("phone2");
	String ketai3 = request.getParameter("phone3");
	String seibetsu = request.getParameter("gender");
	String[] syumi = request.getParameterValues("hobby");
	
	String kotoba = request.getParameter("comment").replace("\n", "<br>");
	%>

	<p>
		아이디는 :
		<%=id%>
		<br> 비밀번호는 :
		<%=ansyo%>
		<br> 이름은 :
		<%=namae%>
		<br> 전화번호는 :
		<%=ketai1%>-<%=ketai2%>-<%=ketai3%>
		<br> 성별은 :
		<%=seibetsu%>
		<br> 취미는 :
		<%if (syumi != null){
		for (int i = 0; i < syumi.length; i ++){
			out.print(" " + syumi[i]);
		}
		}else{
			out.print("선택한 취미가 없습니다.");
		}
		
		%>
		<br> 가입인사 :
		<%=kotoba%>
		<br>
	</p>
</body>
</html>