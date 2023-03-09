<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- 	<%request.setAttribute("now", new Date()); %> --%>
	<p><jsp:useBean id="now" class="java.util.Date"/></p>
	<p>
		date :
		<fmt:formatDate value="${now}" type="date" />
	</p>
	<p>
		short :
		<fmt:formatDate value="${now}" type="time" />
	</p>
	<p>
		date :
		<fmt:formatDate value="${now}" type="both" />
	</p>

	<p>
		default :
		<fmt:formatDate value="${now}" type="both" timeStyle="default"
			timeStyle="default" />
	</p>
	<p>
		short :
		<fmt:formatDate value="${now}" type="both" timeStyle="short"
			timeStyle="short" />
	</p>

	<p>
		default :
		<fmt:formatDate value="${now}" type="both" timeStyle="medium"
			timeStyle="" medium"" />
	</p>

	<p>
		long :
		<fmt:formatDate value="${now}" type="both" timeStyle="long"
			timeStyle="long" />
	</p>

	<p>
		full :
		<fmt:formatDate value="${now}" type="both" timeStyle="full"
			timeStyle="full" />
	</p>
	<p>
		pattern :
		<fmt:formatDate value="${now}" type="both"
			pattern="yyyy 년 MM월 dd일 HH시 mm분 ss초 E요일" />
	</p>
</body>
</html>