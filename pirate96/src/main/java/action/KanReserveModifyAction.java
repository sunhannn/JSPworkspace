package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.KanReserveModifyService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReserveVO;

public class KanReserveModifyAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		int r_num = Integer.parseInt(request.getParameter("R_NUM"));
		int r_pri = Integer.parseInt(request.getParameter("R_PRI"));
		
		ReserveVO article = new ReserveVO();
		KanReserveModifyService reserveModifyService = new KanReserveModifyService();

		// 수정한 값들 받아서 reserveBean에 셋팅
		article.setR_NUM(r_num);
		article.setR_PRI(r_pri);
		article.setR_NAME(request.getParameter("R_NAME"));
		article.setR_ID(request.getParameter("R_ID"));
		article.setR_STIME(request.getParameter("R_STIME"));
		article.setR_ETIME(request.getParameter("R_ETIME"));
		article.setR_PH(request.getParameter("R_PH"));
		article.setR_ROOM(request.getParameter("R_ROOM"));
		System.out.println(article.getR_PH());
		reserveModifyService.modifyArticle(article);

		PageInfo pageInfo = new PageInfo();
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("article", article);
		forward = new ActionForward();
		forward.setPath("reserveList.go");
		return forward;
	}

}