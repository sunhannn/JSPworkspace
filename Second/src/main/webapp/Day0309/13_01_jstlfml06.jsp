<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<p>
		한국 :
		<fmt:formatDate value="${now}" type="both" dateStyle="full"
			timeStyle="full" />
	</p>
	<p>
		<fmt:timeZone value="America/New_York">
			뉴욕:
			<fmt:formatDate value="${now}" type="both" dateStyle="full"
				timeStyle="full" />
		</fmt:timeZone>
	</p>

	<p>
		<fmt:timeZone value="Europe/London">
			런던:
			<fmt:formatDate value="${now}" type="both" dateStyle="full"
				timeStyle="full" />
		</fmt:timeZone>
	</p>

	<h3>setTimeZone태그 사용</h3>
	<p>
		한국(대한민국 표준시) :
		<fmt:formatDate value="${now}" type="both" dateStyle="full"
			timeStyle="full" />
	</p>

	<p>
		<fmt:setTimeZone value="GMT-5" />
		뉴욕(그리니치 표준시에서 5시간 뺀 시간) :
		<fmt:formatDate value="${now}" type="both" dateStyle="full"
			timeStyle="full" />
	</p>
	<p>
		<fmt:setTimeZone value="GMT" />
		런던(그리니치 표준시) :
		<fmt:formatDate value="${now}" type="both" dateStyle="full"
			timeStyle="full" />
	</p>
</body>
</html>