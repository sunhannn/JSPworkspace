package com.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/conTextsetServlet")
public class conTextsetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = "홍길동";
		int age = 20;
		
		//저장된 속성값은 웹 어플리케이션이 제거되기 전까지 계속 사용할 수 있다.(전역)
		getServletContext().setAttribute("name", name);
		getServletContext().setAttribute("age", age);
		
		
		
	}

}
