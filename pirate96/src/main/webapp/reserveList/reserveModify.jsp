<%@page import="vo.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
ReserveVO article = (ReserveVO) request.getAttribute("article");
%>
<!-- -start- 관리자 아이디인지 세션 확인 -->
	<%
		String user_id = (String)session.getAttribute("id");  // 이전 페이지에서 로그인으로 받아온 아이디
		String user_pw = (String)session.getAttribute("pw"); // 이전 페이지에서 로그인으로 받아온 비밀번호 
		boolean return_main = false;
		
		if(user_id==null || user_pw==null || !(user_id.equals("admin") || user_pw.equals("1234"))) {
			return_main = true;
		}
		
		if(return_main)
		{
			// 관리자 계정이 아닐 시 메인 페이지로 이동
		    out.print("<script>alert('권한이 없습니다.'); location.href ='main.jsp';</script>");
		}
 	%>
<!-- -end- 관리자 아이디인지 세션 확인 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1">
<title>예약 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style>

body{
background-color: #f5f6f7;
}

.content_all{
width:80%;
margin:0 auto;
}

.content_all section{
width:95%;
margin: 0 auto;
padding-bottom: 15px;
border-bottom: 1px solid #ccc;
}

.write_title{
font-size:36px;
font-weight:bold;
padding: 30px 0;
border-bottom:2px solid #000;
}

.text_zone{
width:75%;
margin:0 auto;
}

.btn_zone{
width: 30%;
margin:0 auto;
margin-top:20px;
margin-bottom:30px;
}

.btn{
background-color:#aacef2;
}

.btn:hover{
    background-color: #75b2f0;
}

.write_table{
   width: 70%;
   margin:0 auto;
   margin-top: 50px;
}

.td_sub{
vertical-align:middle;
text-align: right;
font-size: 0.8em;
font-weight:bold;
padding-right:20px;
border-right:1px solid #ccc;
}

.td_content{
padding-left:20px;
}

.write_table td{
padding-bottom:30px;
}

label{
margin:0;
display:inline-block;
}

.modi_input{
border:none;
border:1px solid #d9d8d7;
padding:5px 0;
padding-left:20px;
width: 175px;
}

.modify_select{
border:1px solid #d9d8d7;
width: 175px;
padding: 5px;
padding-left:20px;
}

</style>
</head>
<body>

<div class="content_all">
   <section>
      <p class="write_title">예약 수정</p>
      
      <div class="text_zone">
      <form action="reserveModifyPro.go" method="post" enctype="multipart/form-data" name="boardform">
  			<input type="hidden" name="R_NUM" value="<%=article.getR_NUM()%>" />
         <table class="write_table">
           		<tr>
					<td class="td_sub"><label for="R_ID">아이디</label></td>
					<td class="td_content"><input class="modi_input" type="text" name="R_ID" id="R_ID"
						value="<%=article.getR_ID()%>" DISABLED /></td>
				</tr>
				<tr>
					<td class="td_sub"><label for="R_NAME">이름</label></td>
					<td class="td_content"><input class="modi_input" name="R_NAME" type="text"
						id="R_NAME" value="<%=article.getR_NAME()%>" required="required" /></td>
				</tr>
				<tr>
					<%
					String r_room = article.getR_ROOM();
					%>
					<td class="td_sub"><label for="R_ROOM">예약룸</label></td>
					<td class="td_content"><select class="modify_select" name="R_ROOM" id="R_ROOM">
                        <option value="1번방" <%="1번방".equals(r_room)?"selected":"" %> >1번방</option>
                        <option value="2번방" <%="2번방".equals(r_room)?"selected":"" %> >2번방</option>
                        <option value="3번방" <%="3번방".equals(r_room)?"selected":"" %>>3번방</option>
                        <option value="4번방" <%="4번방".equals(r_room)?"selected":"" %>>4번방</option>
                        <option value="5번방" <%="5번방".equals(r_room)?"selected":"" %>>5번방</option>
                        <option value="6번방" <%="6번방".equals(r_room)?"selected":"" %>>6번방</option>
					</select></td>
				</tr>
				<tr>
					<%
					String r_stime = article.getR_STIME();
					%>
					<td class="td_sub"><label for="R_STIME">시작 시간</label></td>
					<td class="td_content"><select class="modify_select" name="R_STIME" id="R_STIME">
						<option value="1" <%="1".equals(r_stime)?"selected":"" %>>01:00</option>
                        <option value="2" <%="2".equals(r_stime)?"selected":"" %>>02:00</option>
                        <option value="3" <%="3".equals(r_stime)?"selected":"" %>>03:00</option>
                        <option value="4" <%="4".equals(r_stime)?"selected":"" %>>04:00</option>
                        <option value="5" <%="5".equals(r_stime)?"selected":"" %>>05:00</option>
                        <option value="6" <%="6".equals(r_stime)?"selected":"" %>>06:00</option>
                        <option value="7" <%="7".equals(r_stime)?"selected":"" %>>07:00</option>
                        <option value="8" <%="8".equals(r_stime)?"selected":"" %>>08:00</option>
                        <option value="9" <%="9".equals(r_stime)?"selected":"" %>>09:00</option>
                        <option value="10" <%="10".equals(r_stime)?"selected":"" %>>10:00</option>
                        <option value="11" <%="11".equals(r_stime)?"selected":"" %>>11:00</option>
                        <option value="12" <%="12".equals(r_stime)?"selected":"" %>>12:00</option>
                        <option value="13" <%="13".equals(r_stime)?"selected":"" %>>13:00</option>
                        <option value="14" <%="14".equals(r_stime)?"selected":"" %>>14:00</option>
                        <option value="15" <%="15".equals(r_stime)?"selected":"" %>>15:00</option>
                        <option value="16" <%="16".equals(r_stime)?"selected":"" %>>16:00</option>
                        <option value="17" <%="17".equals(r_stime)?"selected":"" %>>17:00</option>
                        <option value="18" <%="18".equals(r_stime)?"selected":"" %>>18:00</option>
                        <option value="19" <%="19".equals(r_stime)?"selected":"" %>>19:00</option>
                        <option value="20" <%="20".equals(r_stime)?"selected":"" %>>20:00</option>
                        <option value="21" <%="21".equals(r_stime)?"selected":"" %>>21:00</option>
                        <option value="22" <%="22".equals(r_stime)?"selected":"" %>>22:00</option>
                        <option value="23" <%="23".equals(r_stime)?"selected":"" %>>23:00</option>
                        <option value="24" <%="24".equals(r_stime)?"selected":"" %>>24:00</option>
					</select></td>
				</tr>
				<tr>
					<%
					String r_etime = article.getR_ETIME();
					%>
					<td class="td_sub"><label for="R_ETIME">종료 시간</label></td>
					<td class="td_content"><select class="modify_select" name="R_ETIME" id="R_ETIME">
						<option value="1" <%="1".equals(r_etime)?"selected":"" %>>01:00</option>
                        <option value="2" <%="2".equals(r_etime)?"selected":"" %>>02:00</option>
                        <option value="3" <%="3".equals(r_etime)?"selected":"" %>>03:00</option>
                        <option value="4" <%="4".equals(r_etime)?"selected":"" %>>04:00</option>
                        <option value="5" <%="5".equals(r_etime)?"selected":"" %>>05:00</option>
                        <option value="6" <%="6".equals(r_etime)?"selected":"" %>>06:00</option>
                        <option value="7" <%="7".equals(r_etime)?"selected":"" %>>07:00</option>
                        <option value="8" <%="8".equals(r_etime)?"selected":"" %>>08:00</option>
                        <option value="9" <%="9".equals(r_etime)?"selected":"" %>>09:00</option>
                        <option value="10" <%="10".equals(r_etime)?"selected":"" %>>10:00</option>
                        <option value="11" <%="11".equals(r_etime)?"selected":"" %>>11:00</option>
                        <option value="12" <%="12".equals(r_etime)?"selected":"" %>>12:00</option>
                        <option value="13" <%="13".equals(r_etime)?"selected":"" %>>13:00</option>
                        <option value="14" <%="14".equals(r_etime)?"selected":"" %>>14:00</option>
                        <option value="15" <%="15".equals(r_etime)?"selected":"" %>>15:00</option>
                        <option value="16" <%="16".equals(r_etime)?"selected":"" %>>16:00</option>
                        <option value="17" <%="17".equals(r_etime)?"selected":"" %>>17:00</option>
                        <option value="18" <%="18".equals(r_etime)?"selected":"" %>>18:00</option>
                        <option value="19" <%="19".equals(r_etime)?"selected":"" %>>19:00</option>
                        <option value="20" <%="20".equals(r_etime)?"selected":"" %>>20:00</option>
                        <option value="21" <%="21".equals(r_etime)?"selected":"" %>>21:00</option>
                        <option value="22" <%="22".equals(r_etime)?"selected":"" %>>22:00</option>
                        <option value="23" <%="23".equals(r_etime)?"selected":"" %>>23:00</option>
                        <option value="24" <%="24".equals(r_etime)?"selected":"" %>>24:00</option>
					</select></td>
				</tr>
				<tr>
					<td class="td_sub"><label for="R_PRI">가격</label></td>
					<td class="td_content"><input class="modi_input" id="R_PRI" name="R_PRI"
						value=<%=article.getR_PRI()%> required="required" /></td>
				</tr>
				<tr>
					<td class="td_sub"><label for="R_PH">핸드폰 번호</label></td>
					<td class="td_content"><input class="modi_input" id="R_PH" name="R_PH" value=<%=article.getR_PH()%> required="required" />
					</td>
				</tr>

         </table>
         <br>
         <div class="btn_zone">
         <button type="button" class="btn" onClick="location.href='reserveList.go'">목록으로</button>
         <button type="submit" class="btn">수정</button>
         </div>
      </form>
      </div>
   </section>
   </div>

</body>
</html>