package action;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReserveAutoDeleteService;
import svc.ReserveDeleteService;
import vo.ActionForward;
import vo.ReserveVO;

public class ReserveDeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("r_num"));
		ActionForward forward = null;

		if (num == 0) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../mainPage/main.jsp");
		} else {

			String time = LocalDate.now().toString();

			System.out.println("time : " + Integer.parseInt(time.substring(5, 7)));
			System.out.println("time : " + Integer.parseInt(time.substring(8, 10)));

			ArrayList<ReserveVO> dateGo = new ArrayList<ReserveVO>();
			ReserveAutoDeleteService autoDeleteService = new ReserveAutoDeleteService();
			dateGo = autoDeleteService.autoDeleteReserve();
			for (ReserveVO s : dateGo) {
				if (Integer.parseInt(s.getR_DATE().substring(5, 7)) == Integer.parseInt(time.substring(5, 7))
						&& Integer.parseInt(s.getR_DATE().substring(5, 7)) < Integer.parseInt(time.substring(5, 7))) {
					if (Integer.parseInt(s.getR_DATE().substring(8, 10)) < Integer.parseInt(time.substring(8, 10))) {

						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('날짜가 지난 예약은 취소가 불가능합니다.');");
						out.println("location.href='history.back()';");
						out.println("</script>");
					}
				}

			}
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
