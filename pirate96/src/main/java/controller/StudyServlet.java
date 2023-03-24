package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.MemberJoinAction;
import action.MemberLoginAction;
import action.ReserveAction;
import action.ReserveDeleteAction;
import action.ReserveListAction;
import action.ReserveUpdateAction;
import action.ReserveViewAction;
import dao.StudyDAO;
import vo.ActionForward;
import static db.JdbcUtil.*;
import vo.MemberVO;

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

		// 카데고리 값(아이디, 이름 등) 과 검색값(input에 쓴 내용) 받아오기
		String list_search = request.getParameter("search"); // 카테고리
		String list_search_value = request.getParameter("search_value");// 검색값

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

			// 예약 정보 수정
		} else if (command.equals("/relUpAction.go")) {
			action = new ReserveUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 예약 수정 사이트로 이동
		} else if (command.equals("/revUp.go")) {
			forward = new ActionForward();
//			forward.setRedirect(true);
			forward.setPath("./revUpdate.jsp");
		} else if (command.equals("/memberLogin.go")) {
			action = new MemberLoginAction();
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");
			// 회원가입페이지
		} else if (command.equals("/memberJoin.go")) {
			action = new MemberJoinAction();
			forward = new ActionForward(); // 페이지를 보내줘야해서 forward객체 생성 필요
			forward.setRedirect(true); // url변경 페이지 전송 데이터전송x
			forward.setPath("./joinForm.jsp");
			// 로그인 서블릿
		} else if (command.equals("/memberLoginAction.go")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 회원가입 서블릿
		} else if (command.equals("/memberJoinAction.go")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}

		} // 아이디 중복검사 아약스인데 모름
		else if (command.equals("/loginCheck.go")) {

			String id = request.getParameter("uid");
			System.out.println(id);

			MemberVO member = new MemberVO();
			member.setM_ID(id);
			StudyDAO study = study.getInstance();
			boolean result = study.idCheck(member); // 메소드필요

			String str;

			if (result)
				str = "사용하실 수 없는 아이디입니다.";

			else
				str = "사용 가능한 아이디입니다.";

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("str", str);
			map.put("M_ID", id);

//			JSONObject jObject = new JSONObject();
//			jObject.put("map", map);

			response.setContentType("application/x-json; charset=utf-8");

//			response.getWriter().print(jObject);
			// 회원탈퇴 서블릿
		} else if (command.equals("/memberDeleteAction.me")) {
			action = new MemberDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 내정보수정 서블릿
		} else if (command.equals("/memberUpdateAction.me")) {
			action = new MemberUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}

		} else if (command.equals("/memberLogout.me")) {
			HttpSession session = request.getSession(false);
			session.invalidate();
			response.sendRedirect("loginForm.jsp");

		} else if (command.equals("/myinfo.go")) {

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/reserveList.go")) {
			action = new ReserveListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // 예약 검색-----------------------------------
		else if (command.equals("/reserveSearch.go")) {
			action = new ReserveSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 예약 수정 폼 가는 거--------------------------------------
		} else if (command.equals("/reserveModify.go")) {
			action = new ReserveModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 예약 수정 완료하기(DB데이터 바꾸기)--------------------------------------
		} else if (command.equals("/reserveModifyPro.go")) {
			action = new ReserveModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 예약 삭제--------------------------------------
		} else if (command.equals("/reserveDelete.go")) {
			action = new ReserveDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 회원관리창-----------------------------------
		} else if (command.equals("/memberList.go")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 회원 검색-----------------------------------
		} else if (command.equals("/memberSearch.go")) {
			action = new MemberSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 게시판 글쓰기
		} else if (command.equals("/boardWriteForm.go")) {
			forward = new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");

			// 게시판 글쓰기 (액션)
		} else if (command.equals("/boardWritePro.go")) {
			action = new BoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 리스트 보기
		} else if (command.equals("/boardList.go")) {
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 리스트 상세보기
		} else if (command.equals("/boardDetail.go")) {
			action = new BoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 게시판 글 수정
		} else if (command.equals("/boardModifyForm.go")) {
			action = new BoardModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 게시판 글 수정(액션)
		} else if (command.equals("/boardModifyPro.go")) {
			action = new BoardModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글 삭제하기
		} else if (command.equals("/boardDeleteForm.go")) {
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			request.setAttribute("board_num", board_num);
			forward = new ActionForward();
			forward.setPath("/board/qna_board_delete.jsp");
			// 글 삭제하기(액션)
		} else if (command.equals("/boardDeletePro.go")) {
			action = new BoardDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 글 검색하기
		} else if (command.equals("/reserveSearch.go")) {
			action = new ReserveSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else {
			try {
				// fileName 파라미터로 파일명을 가져온다.
				String fileName = request.getParameter("fname");

				// 파일이 실제 업로드 되어있는(파일이 존재하는) 경로를 지정한다.
				String filePath = "C:\\jspwork\\servletproject\\src\\main\\webapp\\boardUpload\\";

				// 경로와 파일명으로 파일 객체를 생성한다.
				File dFile = new File(filePath, fileName);

				// 파일 길이를 가져온다.
				int fSize = (int) dFile.length();

				// 파일이 존재
				if (fSize > 0) {

					// 파일명을 URLEncoder 하여 attachment, Content-Disposition Header로 설정
					String encodedFilename = "attachment; filename*=" + "UTF-8" + "''"
							+ URLEncoder.encode(fileName, "UTF-8");

					// ContentType 설정
					response.setContentType("application/octet-stream; charset=utf-8");

					// Header 설정
					response.setHeader("Content-Disposition", encodedFilename);

					// ContentLength 설정
					response.setContentLengthLong(fSize);

					BufferedInputStream in = null;
					BufferedOutputStream out = null;

					in = new BufferedInputStream(new FileInputStream(dFile));
					out = new BufferedOutputStream(response.getOutputStream());

					try {
						byte[] buffer = new byte[4096];
						int bytesRead = 0;

						/*
						 * 모두 현재 파일 포인터 위치를 기준으로 함 (파일 포인터 앞의 내용은 없는 것처럼 작동) int read() : 1byte씩 내용을 읽어
						 * 정수로 반환 int read(byte[] b) : 파일 내용을 한번에 모두 읽어서 배열에 저장 int read(byte[] b. int
						 * off, int len) : 'len'길이만큼만 읽어서 배열의 'off'번째 위치부터 저장
						 */
						while ((bytesRead = in.read(buffer)) != -1) {
							out.write(buffer, 0, bytesRead);
						}

						// 버퍼에 남은 내용이 있다면, 모두 파일에 출력
						out.flush();
					} finally {
						/*
						 * 현재 열려 in,out 스트림을 닫음 메모리 누수를 방지하고 다른 곳에서 리소스 사용이 가능하게 만듬
						 */
						in.close();
						out.close();
					}
				} else {
					throw new FileNotFoundException("파일이 없습니다.");
				}
			} catch (Exception e) {
				e.getMessage();
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
