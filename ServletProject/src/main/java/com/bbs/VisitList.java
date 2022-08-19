package com.bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.util.*;

@WebServlet("/VisitList")
public class VisitList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		processRequest(request, response);
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			
			out.println("<html>");
			out.println("<head><title>방명록 리스트</title></head>");
			
			
			out.println("<body>");
			StringBuffer sql = new StringBuffer();
			sql.append("select no, writer, memo, regdate ");
			sql.append("from visit ");
			sql.append("order by no desc");
			 Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      try {
		         
		         Class.forName("oracle.jdbc.driver.OracleDriver");
		         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		      
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String memo = rs.getString("memo");
				java.sql.Date regdate = rs.getDate("regdate");
				
				out.println("<table align=center width=500 border=1>");
				out.println("<tr>");
				out.println("<th width=50>번호</th>");
				out.println("<td width=70 align=center>"+no+"</td>");
				
				out.println("<th width=70>작성자</th>");
				out.println("<td width=180 align=center>"+writer+"</td>");
				
				out.println("<th width=50>날짜</th>");
				out.println("<td width=100 align=center>"+regdate+"</td>");
				
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th width=50>내용</th>");
				out.println("<td colspan=5>&nbsp;");
				out.println("<textarea rows=3 cols=50>"+memo+"</textarea>");
				
				
			
				
				
				out.println("</td>");
				out.println("</tr>");
				
				
				out.println("</table>");
				out.println("<p>");
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException es) {
		es.printStackTrace();
		}finally {
			try{if(rs != null)rs.close(); }catch(SQLException ss) {}
			try{if(rs != null)rs.close(); }catch(SQLException ss) {}
			try{if(rs != null)rs.close(); }catch(SQLException ss) {}
		}
		    out.println("<p align=center><a href=/ServletProject/bbs/write.html>글쓰기</a></p>");
			out.println("</body>");
			out.println("</html>");
	}finally {
		out.close();
	}
		
	}
	}
