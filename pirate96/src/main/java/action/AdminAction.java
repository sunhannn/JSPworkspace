package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class AdminAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		if (id.equals(null)) {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자만 접근이 가능합니다!');");
			out.println("location.href='./memberLogin.go';");
			out.println("</script>");

		} else if (id.equals("admin")) {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자님 환영합니다!');");
			out.println("location.href='../admin.jsp");
			out.println("</script>");

		} else {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자만 접근이 가능합니다!');");
			out.println("history.back()");
			out.println("</script>");

		}

		return null;
	}

}
