package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberDeleteService;
import vo.ActionForward;

public class MemberDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = null;

		if (id == null) {

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");

		} else {
			// id != null
			String deleteId = id;
			MemberDeleteService memberDeleteService = new MemberDeleteService();

			boolean deleteResult = memberDeleteService.deleteMember(deleteId);

			if (deleteResult) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./loginForm.jsp");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보삭제 실패.');");
				out.println("location.href='./memberLogin.go';");
				out.println("</script>");
			}
		}
		return forward;
	}
}