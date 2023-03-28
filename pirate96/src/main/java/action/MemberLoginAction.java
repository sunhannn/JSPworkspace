package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberLoginService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();

		member.setM_ID(request.getParameter("M_ID"));
		member.setM_PW(request.getParameter("M_PW"));

		MemberLoginService memberLoginService = new MemberLoginService();
		boolean loginResult = memberLoginService.login(member);
		ActionForward forward = null;
		if (loginResult) {
			forward = new ActionForward();
			session.setAttribute("id", member.getM_ID());
			forward.setRedirect(true);
			forward.setPath("../mainPage/main.jsp");
		} else {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패');");
			out.println("location.href='./memberLogin.go';");
			out.println("</script>");
		}
		return forward;
	}
}