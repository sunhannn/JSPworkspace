package com.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/loginform/Sports")
public class SportSvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");	
	
	String[] sports = request.getParameterValues("Sports");
	String gender = request.getParameter("gender");
	
	for (String sport : sports) {
		System.out.println("취미"+sport);
	}
	System.out.println();
	System.out.println("성별"+gender);
	
	}
	
	
	
}
