package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.KanReserveDeleteService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReserveVO;

public class KanReserveDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		String nowPage = request.getParameter("page");
		KanReserveDeleteService reserveDeleteService = new KanReserveDeleteService();
		reserveDeleteService.deleteArticle(r_num);

		PageInfo pageInfo = new PageInfo();
		request.setAttribute("pageInfo", pageInfo);
//		request.setAttribute("article", article);
		forward = new ActionForward();
		forward.setPath("reserveList.go");
		return forward;
	}

}