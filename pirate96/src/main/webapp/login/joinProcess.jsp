<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="vo.Member" %>

<%
	request.setCharacterEncoding("UTF-8");
	String M_ID=request.getParameter("M_ID");
	String M_PW=request.getParameter("M_PW");
	String M_NAME=request.getParameter("M_NAME");
	String M_PH =request.getParameter("M_PH");
	String M_ADDR=request.getParameter("M_ADDR");
	String M_EMAIL=request.getParameter("M_EMAIL");
	String M_GENDER=request.getParameter("M_GENDER");
	
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	try {
  		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
  		conn = ds.getConnection();
  		
  		pstmt=conn.prepareStatement("INSERT INTO member VALUES ( ? , ?, ?, ?, ?, ?, ? )");
  		pstmt.setString(1,M_ID);
  		pstmt.setString(2,M_PW);
  		pstmt.setString(3,M_NAME);
  		pstmt.setString(4,M_PH);
  		pstmt.setString(5,M_ADDR);
  		pstmt.setString(6,M_EMAIL);
  		pstmt.setString(7,M_GENDER);
  		
  		int result=pstmt.executeUpdate();
  		
  		if(result!=0){  	
  			out.println("<script>");
  		  	out.println("location.href='login.html'");
  		  	out.println("</script>");
  		}else{
  			out.println("<script>");
  	  		out.println("location.href='joinForm.jsp'");
  	  		out.println("</script>");	
  		}
	}catch(Exception e){
		e.printStackTrace();
 	}finally{
 		try{
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 	}
%>
<%=M_ID%> <%=M_PW %> <%=M_NAME %> <%=M_PH %> <%=M_ADDR %> <%=M_EMAIL %> <%=M_GENDER %>