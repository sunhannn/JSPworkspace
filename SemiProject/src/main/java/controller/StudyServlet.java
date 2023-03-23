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
import action.ReserveUpdateAction;
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
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		// 예약 페이지 if문
		if (command.equals("/rev.go")) {
			action = new ReserveAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 예약 정보 상세보기
		} else if (command.equals("/revSel.go")) {

			action = new ReserveViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 아이디에 맞는 예약 정보들 보기
		} else if (command.equals("/revList.go")) {
			action = new ReserveListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 예약 취소 (임시 삭제 테이블로 보냄)
		} else if (command.equals("/revDel.go")) {

			action = new ReserveDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			//예약 정보 수정
		} else if (command.equals("/relUpAction.go")) {
			action = new ReserveUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//예약 수정 사이트로 이동
		} else if (command.equals("/revUp.go")) {
			forward = new ActionForward();
//			forward.setRedirect(true);
			forward.setPath("./revUpdate.jsp");
		} else if (command.equals("/revLoginAction.go")) {
			 
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
