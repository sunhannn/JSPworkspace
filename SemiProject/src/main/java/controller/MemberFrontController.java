package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;

import action.MemberDeleteAction;
import action.MemberJoinAction;

import action.MemberLoginAction;
import action.MemberUpdateAction;
import dao.MemberDAO;
import vo.ActionForward;
import vo.Member;

@WebServlet("*.me")
public class MemberFrontController extends javax.servlet.http.HttpServlet {
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		
	
		
		
	
	
		//로그인 페이지
		if (command.equals("/memberLogin.me")) {
			action = new MemberLoginAction();
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");
		//회원가입페이지	
		} else if (command.equals("/memberJoin.me")) {
			action = new MemberJoinAction();
			forward = new ActionForward(); //페이지를 보내줘야해서 forward객체 생성 필요
			forward.setRedirect(true); // url변경 페이지 전송 데이터전송x
			forward.setPath("./joinForm.jsp");
		//로그인 서블릿	
		}else if (command.equals("/memberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//회원가입 서블릿
		} else if (command.equals("/memberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}
			
		}
		//아이디 중복검사 아약스인데 모름
		else if (command.equals("/loginCheck.me")) {
			
			String id = request.getParameter("uid"); 
			System.out.println(id);
			

			Member member = new Member();
			member.setM_ID(id);
			MemberDAO DAO = MemberDAO.getInstance();
			boolean result = DAO.idCheck(member); //메소드필요
			
			String str ;
			
			if(result) str = "사용하실 수 없는 아이디입니다.";
		
			else str = "사용 가능한 아이디입니다.";
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("str", str);
			map.put("M_ID", id);

			JSONObject jObject = new JSONObject();
			jObject.put("map", map);

			response.setContentType("application/x-json; charset=utf-8");
		
			response.getWriter().print(jObject); 
		}

	
			//회원탈퇴 서블릿
		 else if (command.equals("/memberDeleteAction.me")) {
			action = new MemberDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//내정보수정 서블릿
		} else if (command.equals("/memberUpdateAction.me")) {
			action = new MemberUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}

		}
			if (forward != null) {
				if (forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
}