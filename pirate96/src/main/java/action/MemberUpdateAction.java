package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberUpdateService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("M_ID :" + id);
		ActionForward forward = null;

		MemberVO member = new MemberVO(); // 객체 생성해서 request에다가 값 넣어
		member.setM_ID(request.getParameter("M_ID"));
		member.setM_PW(request.getParameter("M_PW"));
		member.setM_NAME(request.getParameter("M_NAME"));
		member.setM_PH(request.getParameter("M_PH"));
		member.setM_ADDR(request.getParameter("M_ADDR"));
		member.setM_EMAIL(request.getParameter("M_EMAIL"));
		member.setM_GENDER(request.getParameter("M_GENDER"));

		System.out.println(member.getM_ID());

		if (id == null) {

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");

		} else {
			MemberUpdateService memberUpdateService = new MemberUpdateService();

			String updateId = id;
			boolean updateResult = memberUpdateService.updateMember(updateId, member);
			if (updateResult == false) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<scirpt>");
				out.println("alert('회원정보 수정에 실패했습니다.');");
				out.println("history.back()");
				out.println("</script>");

			} else {
				session.setAttribute("id", member.getM_ID());
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./mypage.jsp");

			}
		}
		return forward;
	}
}
