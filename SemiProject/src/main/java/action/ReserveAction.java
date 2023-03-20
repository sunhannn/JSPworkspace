package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ReserveVO;
import vo.ActionForward;
import svc.RerserveService;

public class ReserveAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		ReserveVO reserve = new ReserveVO();
		boolean reserveResult = false;

		reserve.setR_ID(request.getParameter("R_ID"));
		reserve.setR_NAME(request.getParameter("R_NAME"));
		reserve.setR_NUM(Integer.parseInt(request.getParameter("R_NUM")));
		reserve.setR_PH(request.getParameter("R_PH"));
		reserve.setR_PRI(Integer.parseInt(request.getParameter("R_PRI")));
		reserve.setR_ROOM(request.getParameter("R_ROOM"));
		reserve.setR_TIME(request.getParameter("R_TIME"));

		RerserveService reserveService = new RerserveService();

		reserveResult = reserveService.reserveResult(reserve);

		if (reserveResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약에 실패하였습니다!')");
			out.println("history.back()");
			out.println("</script>");

		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");

		}

		return forward;
	}

}
