package com.filter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.*;

public class LogFileFilter implements Filter {

	PrintWriter writer;

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter02_2 초기화...");
		String realpath = "C:\\log\\";
		File f = new File(realpath);
		if (!f.exists()) {

			f.mkdirs();
		}
		String filename = fConfig.getInitParameter("filename");
		if (filename == null)
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		try {
			writer = new PrintWriter(new FileWriter(realpath + filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02_2 doFilter()...");
		writer.printf("현재일시 : %s %n", getCurrentTime());
		String clientAddr = request.getRemoteAddr(); // ip주소 정보 가져옴
		writer.printf("클라이언트 주소 : %s %n", clientAddr);

		chain.doFilter(request, response);

		String contentType = response.getContentType();
		writer.printf("문서의 콘텐츠 유형 : %s %n", contentType);
		writer.println("------------------------------------");
		destroy();

	}

	public void destroy() {
		writer.println("destroy()메소드 호출, 강제해제");
		writer.close();
	}

	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH::mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());

	}

}
