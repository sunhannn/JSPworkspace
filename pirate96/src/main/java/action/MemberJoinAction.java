package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.MemberJoinService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberJoinAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		MemberVO member = new MemberVO();
		boolean joinResult = true;

		member.setM_ID(request.getParameter("M_ID"));
		member.setM_PW(request.getParameter("M_PW"));
		member.setM_NAME(request.getParameter("M_NAME"));
		member.setM_PH(request.getParameter("M_PH"));
		member.setM_ADDR(request.getParameter("M_ADDR"));
		member.setM_EMAIL(request.getParameter("M_EMAIL"));
		member.setM_GENDER(request.getParameter("M_GENDER"));
		
		
		MemberJoinService memberJoinService = new MemberJoinService();
		joinResult = memberJoinService.joinMember(member);

		ActionForward forward = null;
		if (joinResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원등록실패')");
			out.println("history.back()");
			out.println("</script>");

		} else {
			forward = new ActionForward();
//		   		forward.setRedirect(true);
			forward.setPath("/loginForm.jsp");
		}
		return forward;
	}
}