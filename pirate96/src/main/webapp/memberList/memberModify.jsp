<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberVO article = (MemberVO) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width,initial-scale=1">
<title>회원 목록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style>
body {
	background-color: #f5f6f7;
}

.content_all {
	width: 80%;
	margin: 0 auto;
}

.content_all section {
	padding-bottom: 15px;
}

.write_title {
	font-size: 36px;
	font-weight: bold;
	padding: 30px 0;
	border-bottom: 2px solid #000;
}

.text_zone {
	width: 75%;
	margin: 0 auto;
}

.btn_zone {
	width: 30%;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 30px;
}

.btn {
	background-color: #aacef2;
}

.btn:hover {
	background-color: #75b2f0;
}

.write_table {
	width: 70%;
	margin: 0 auto;
	margin-top: 50px;
}

.td_sub {
	vertical-align: middle;
	text-align: right;
	font-size: 0.8em;
	font-weight: bold;
	padding-right: 20px;
	border-right: 1px solid #ccc;
}

.td_content {
	padding-left: 20px;
}

.write_table td {
	padding-bottom: 30px;
}

label {
	margin: 0;
	display: inline-block;
}

.modi_input {
	border: none;
	border: 1px solid #d9d8d7;
	padding: 5px 0;
	padding-left: 20px;
	width: 175px;
}

.modify_select {
	border: 1px solid #d9d8d7;
	width: 175px;
	padding: 5px;
	padding-left: 20px;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div class="content_all">
		<section>
			<p class="write_title">회원 수정</p>
			<div class="text_zone">
				<form action="memberModifyPro.go" method="post"
					enctype="multipart/form-data" name="boardform">
					<input type="hidden" name="M_ID" value="<%=article.getM_ID()%>" />
					<table class="write_table">
						<tr>
							<td class="td_sub"><label for="M_ID">아이디</label></td>
							<td class="td_content"><input class="modi_input" type="text"
								name="M_ID" id="M_ID" value="<%=article.getM_ID()%>" DISABLED /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_NAME">이름</label></td>
							<td class="td_content"><input class="modi_input"
								name="M_NAME" type="text" id="M_NAME"
								value="<%=article.getM_NAME()%>" required="required" /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_PH">핸드폰 번호</label></td>
							<td class="td_content"><input class="modi_input" id="M_PH"
								name="M_PH" value=<%=article.getM_PH()%> required="required" /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_ADDR">주소</label></td>
							<td class="td_content"><input class="modi_input" id="M_ADDR"
								name="M_ADDR" value=<%=article.getM_ADDR()%> required="required" />
							</td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_EMAIL">이메일</label></td>
							<td class="td_content"><input class="modi_input"
								id="M_EMAIL" name="M_EMAIL" value=<%=article.getM_EMAIL()%>
								required="required" /></td>
						</tr>
						<tr>
							<td class="td_sub"><label for="M_GENDER">성별</label></td>
							<td class="td_content"><input class="modi_input"
								id="M_GENDER" name="M_GENDER" value=<%=article.getM_GENDER()%> />
							</td>
						</tr>

					</table>
					<br>
					<div class="btn_zone">
						<button type="button" class="btn"
							onClick="location.href='memberList.go'">목록으로</button>
						<button type="submit" class="btn" id="btn1">수정</button>
					</div>
				</form>
			</div>
		</section>

	</div>

	<div class="footer">
		<%@ include file="/footer.jsp"%>
	</div>