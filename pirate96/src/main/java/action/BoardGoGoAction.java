package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class BoardGoGoAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = null;
		
	
		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + id + "님 환영합니다!');");
			out.println("location.href='boardList.go';");
			out.println("</script>");
		}
		return forward;
	}

}
