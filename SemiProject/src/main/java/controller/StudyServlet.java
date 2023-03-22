package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ReserveAction;
import action.ReserveDeleteAction;
import action.ReserveListAction;
import action.ReserveViewAction;
import vo.ActionForward;
import static db.JdbcUtil.*;

@WebServlet("*.go")
public class StudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
//		System.out.println(request.getRequestURI());
		String contextPath = request.getContextPath();
//		System.out.println(request.getContextPath());
		String command = RequestURI.substring(contextPath.length());
//		System.out.println(command);
		ActionForward forward = null;
		Action action = null;

		// 예약 페이지 if문
		if (command.equals("/rev.go")) {
			action = new ReserveAction();
//			forward.setPath("/board/qna_board_write.jsp");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/revSel.go")) {
			
			action = new ReserveViewAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}else if(command.equals("/revList.go")) {
			action = new ReserveListAction();
			
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}else if (command.equals("/revDel.go")) {
			
			action = new ReserveDeleteAction();
			
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
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
		doProcess(request, response);
	}

}
