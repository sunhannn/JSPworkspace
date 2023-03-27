<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberVO article = (MemberVO)request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
	<title>회원 수정 폼</title>
	<script type="text/javascript">
	function modifymember(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
   #registForm{
      width: 500px;
      height: 600px;
      border : 1px solid red; 
      margin:auto; 
   }   
   h2{
      text-align: center;
   }
   table{
      margin:auto;
      width: 450px;
      }
   .td_left{
      width: 150px;
      background:orange;
   }
   .td_right{
      width: 300px;
      background:skyblue;
   }
   #commandCell{
      text-align: center;
      
   }
</style>
</head>
<body>
<!-- 게시판 등록 -->

<section id = "writeForm">
<h2>게시판글수정</h2>
<form action="memberModifyPro.go" method="post" name = "modifyform"
>
<input type = "hidden" name = "M_ID" value = "<%=article.getM_ID()%>"/>
<table>
	<tr>
		<td class="td_left">
			<label for = "M_ID">아이디</label>
		</td>
		<td class="td_right">
			<input type = "text" name="M_ID" id = "M_ID" value = "<%=article.getM_ID()%>" DISABLED/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "M_NAME">이름</label>
		</td>
		<td class="td_right">
			<input name="M_NAME" type="text" id = "M_NAME" value = "<%=article.getM_NAME()%>"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "M_PH">핸드폰 번호</label>
		</td>
		<td>
			<input id = "M_PH" name="M_PH" value =<%=article.getM_PH()%> />
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "M_ADDR">주소</label>
		</td>
		<td>
			<input id = "M_ADDR" name="M_ADDR" value = <%=article.getM_ADDR()%> />
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "M_EMAIL">이메일</label>
		</td>
		<td>
			<input id = "M_EMAIL" name="M_EMAIL" value = <%=article.getM_EMAIL()%> />
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "M_GENDER">성별</label>
		</td>
		<td>
			<input id = "M_GENDER" name="M_GENDER" value = <%=article.getM_GENDER()%> />
		</td>
	</tr>
</table>
	<section id = "commandCell">
			<a href="javascript:modifymember()">[수정완료]</a>
			<a href="memberList.go">[돌아가기]</a>
	</section>
</form>
</section>
</body>
</html>