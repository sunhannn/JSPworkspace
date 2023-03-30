 <%@page import="vo.BoardVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
    String nowPage = (String)request.getAttribute("page");
%>
<%
BoardVO article = (BoardVO)request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.js"></script>
<style>
body{
background-color: #f5f6f7;
}
.content_all{
   width: 80%;
   margin: 0 auto;
   }
   .title{
   font-size: 36px;
   font-weigth: bold;
   text-align: center;
   width: 80%;
   margin: 0 auto;
   padding: 30px 0;
   }
   #basicInfoArea{
      font-size: 25px;
      width: 75%;
      margin:0 auto;
      margin-bottom: 40px;
      text-align: center;
      border-top: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
   }
   .p_file{
   display:inline;
   }
   #articleContentArea{
      font-size: 16px;
      width: 75%;
      margin:0 auto;
      margin-top: 20px;
      margin-bottom: 40px;
      border-bottom: 1px solid #ccc;
	  height: 350px;
	  overflow: auto;
   }
   form{
   display:inline;
   }
   .button{
   background-color:#aacef2;
   border:none;
   border-radius:5px;
   padding: 0.375rem 0.75rem;
   font-size: 1rem;
   }
   
   .btn_zone{
   width: 75%;
   margin: 0 auto;
   text-align:center;
}

</style>
</head>

<body>
<%@ include file="/header.jsp" %>
	<div class="content_all">

 
	<section id="articleForm">
		<div class="page-title">
					<p class="title">공지사항</p>
				</div>
		<section id="basicInfoArea">
			제 목 :
			<%=article.getBOARD_SUBJECT()%>
			첨부파일 :
			<%if(!(article.getBOARD_FILE()==null)){ %>
			<a href="filedown.go?fname=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE() %>
			</a><%} %>
			
			<%if((article.getBOARD_FILE()==null)){ %>
			<p class="p_file">첨부파일 없음</p>
			<%} %>
		</section>
		<section id="articleContentArea">
			<%=article.getBOARD_CONTENT() %>
		</section>
	</section>

	
	<section class="btn_zone">
	<c:if test="${ 'admin' eq id }">
	    <button type="button" class="button" onclick="location.href='boardModifyForm.go?board_num=<%=article.getBOARD_NUM() %>'">수정</button>
       </c:if>
	
        <script>
        function test() {
            if (!confirm("정말 삭제하시겠습니까?")) {
            	return false;
            } else {
                alert("삭제 되었습니다.");
            }
        }
        </script>
        <form name="deleteForm" action="boardDeletePro.go?board_num=<%=article.getBOARD_NUM() %>" method="post">
        <input type = "hidden" name = "page" value = "<%=nowPage %>"/>
        <c:if test="${ 'admin' eq id }">
        <button type="submit" class="button" onclick="return test()">삭제</button>
        </c:if>
        </form>
        <button type="button" class="button" onclick="location.href='boardList.go?<%=article.getBOARD_NUM() %>page=${page }'">목록</button>
	</section>

	</div>
	<%@ include file="/footer.jsp" %>
</body>
</html>
		