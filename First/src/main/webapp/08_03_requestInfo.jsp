<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
	<h2>현재페이지 url :
		http://localhost:8090/jspfirst/08_03requestInfo.jsp</h2>
	<h3>프로토콜 : http</h3>
	<h3>ip주소(=서버이름) : localhost</h3>
	<h3>포트번호 : 8090</h3>
	<h3>경로 : /first/08_03_requestInfo.jsp</h3>
	<dl>
		<dt>
			<strong style="font-weight: bolder">localhost 정보</strong>
		</dt>
		<dd>Ipv4 주소 형식 값으로 표시 : 127.0.0.1</dd>
		<dd>Ipv6 주소 형식 값으로 표시 : 0:0:0:0:0:0:0:1</dd>
	</dl>
	<ul>
		<li>요청정보 인코딩 = <%=request.getCharacterEncoding()%> <br> <small
			style="color: red">클라이언트가 전송한 요청 정보의 문자셋을 구함. String으로 반환</small></li>

		<li>파라미터 정보 1 = <%=request.getParameter("id")%> <br> 파라미터 정보
			2 =<%=java.net.URLDecoder.decode(request.getParameter("name"))%> <br>
			<%-- 파라미터 정보 2 = <%request.getParameter("name")%> --%>
		</li>

	</ul>
</body>
</html>