package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ReserveVO;
import vo.ActionForward;
import svc.JoongbokService;
import svc.RerserveService;

public class ReserveAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		ReserveVO reserve = new ReserveVO();
		boolean reserveResult = false;

		reserve.setR_ID(request.getParameter("M_ID"));
		reserve.setR_NAME(request.getParameter("M_NAME"));
		reserve.setR_DATE(request.getParameter("R_DATE"));
		reserve.setR_PH(request.getParameter("M_PH"));
		reserve.setR_ROOM(request.getParameter("R_ROOM"));
		reserve.setR_STIME(request.getParameter("R_STIME"));
		reserve.setR_ETIME(request.getParameter("R_ETIME"));

		int roomNum = Integer.parseInt(reserve.getR_ROOM());
		int time = Integer.parseInt(reserve.getR_ETIME()) - Integer.parseInt(reserve.getR_STIME());
		if (roomNum < 3) {
			reserve.setR_PRI(10000 * time);

		} else if (roomNum < 5) {
			reserve.setR_PRI(20000 * time);
		} else {
			reserve.setR_PRI(30000 * time);
		}

		JoongbokService joongbok = new JoongbokService();
		ArrayList<ReserveVO> joongbokList = joongbok.reserveCheck(reserve.getR_DATE());

		boolean check1 = false;
		boolean check2 = false;
		boolean check3 = false;
		for (ReserveVO s : joongbokList) {
			if (Integer.parseInt(s.getR_STIME())  == Integer.parseInt(reserve.getR_STIME())) {
				check1 = true;
				break;
			}

		}
		for (ReserveVO s : joongbokList) {
			if (Integer.parseInt(s.getR_ETIME())  == Integer.parseInt(reserve.getR_ETIME())) {
				check2 = true;
				break;
			}

		}
		for (ReserveVO s : joongbokList) {
			if (Integer.parseInt(s.getR_ROOM())  == Integer.parseInt(reserve.getR_ROOM())) {
				check3 = true;
				break;
			}

		}

		

		
		if (check1 && check2 && check3) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 예약된 객실입니다!')");
			out.println("history.back()");
			out.println("</script>");
			return forward;
		}

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
			forward.setPath("./revSuccess.jsp");

		}

		return forward;
	}

}
