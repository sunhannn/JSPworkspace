package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/loginCheck")
public class LoginCheck extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("HelloServlet doProcess()");

		String id = request.getParameter("id");
		System.out.println("id  : " + id);

		MemberVO mVO = new MemberVO();
		mVO.setId(id);
		MemberDAO mDAO = new MemberDAO();
		boolean result = mDAO.idCheck(mVO);
		String str ;
		
		if(result) str = "사용하실 수 없는 아이디입니다.";
		else str = "사용 가능한 아이디입니다.";
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("str", str);
		map.put("id", id);

		JSONObject jObject = new JSONObject();
		jObject.put("map", map);

		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObject); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
