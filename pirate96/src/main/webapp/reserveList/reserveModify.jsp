<%@page import="vo.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
ReserveVO article = (ReserveVO) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 수정 폼</title>
<script type="text/javascript">
	function modifyreserve() {
		modifyform.submit();
	}
</script>
<style type="text/css">
#registForm {
	width: 500px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 등록 -->

	<section id="writeForm">
		<h2>게시판글수정</h2>
		<form action="reserveModifyPro.go" method="post" name="modifyform">
			<input type="hidden" name="R_NUM" value="<%=article.getR_NUM()%>" />
			<table>
				<tr>
					<td class="td_left"><label for="R_ID">아이디</label></td>
					<td class="td_right"><input type="text" name="R_ID" id="R_ID"
						value="<%=article.getR_ID()%>" DISABLED /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="R_NAME">이름</label></td>
					<td class="td_right"><input name="R_NAME" type="text"
						id="R_NAME" value="<%=article.getR_NAME()%>" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="R_TIME">시작 시간</label></td>
					<td><input id="R_TIME" name="R_TIME"
						value=<%=article.getR_STIME()%> /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="R_TIME">종료 시간</label></td>
					<td><input id="R_TIME" name="R_TIME"
						value=<%=article.getR_ETIME()%> /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="R_PRI">가격</label></td>
					<td><input id="R_PRI" name="R_PRI"
						value=<%=article.getR_PRI()%> /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="R_PH">핸드폰 번호</label></td>
					<td><input id="R_PH" name="R_PH" value=<%=article.getR_PH()%> />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="R_ROOM">예약룸</label></td>
					<td><input id="R_ROOM" name="R_ROOM"
						value=<%=article.getR_ROOM()%> /></td>
				</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyreserve()">[수정완료]</a>&nbsp;&nbsp; <a
					href="reserveList.go">[돌아가기]</a>
			</section>
		</form>
	</section>
</body>
</html>