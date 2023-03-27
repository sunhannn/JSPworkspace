package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReserveDeleteService;
import vo.ActionForward;

public class ReserveDeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		ActionForward forward = null;

		if (num == 0) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../mainPage/main.jsp");
		} else {
			int deleteNum = num;
			ReserveDeleteService reserveDeleteService = new ReserveDeleteService();
			boolean deleteResult = reserveDeleteService.deleteReserve(deleteNum);

			if (deleteResult) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./revList.go");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('예약정보삭제 실패.');");
				out.println("location.href='./main.jsp';");
				out.println("</script>");
			}

		}

		return forward;
	}
}
