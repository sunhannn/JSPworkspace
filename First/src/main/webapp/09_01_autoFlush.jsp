<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--     <%@ page buffer="1kb" autoFlush="true" %> --%>
<%-- <%@page buffer="1kb" autoFlush="false" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성</title>
</head>
<body>
	<h2>out객체와 buffer속성</h2>
	<p>buffer속성을 사용하여 buffer를 지정하면 out객체는 기본적으로 설정한 값의 크기의 버퍼를 내부적으로
		사용한다.</p>
	<p>autoFlush속성은 버퍼가 가득차면 비울지(브라우저로 출력 결과를 전송함)의 여부를 지정하는 속성인데, 기본값은
		true이다.</p>
	<%
	for (int i = 0; i < 1000; i++) {
	%>
	1234
	<%
	//out.flush();
	//out.clear();
	//out.clearBuffer();
	}
	%>
	실제 설정된 버퍼 크기 :
	<%=out.getBufferSize()%>Byte
	<br> 남은 크기 :
	<%=out.getRemaining()%>Byte
	<br> autoFlush여부 :
	<%=out.isAutoFlush()%>
</body>
</html>