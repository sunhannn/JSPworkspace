package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.KanMemberModifyService;
import vo.ActionForward;
import vo.MemberVO;
import vo.PageInfo;

public class KanMemberModifyAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		MemberVO article = new MemberVO();
		KanMemberModifyService memberModifyService = new KanMemberModifyService();

		// 수정한 값들 받아서 reserveBean에 셋팅
		article.setM_ID(request.getParameter("M_ID"));
		article.setM_NAME(request.getParameter("M_NAME"));
		article.setM_PH(request.getParameter("M_PH"));
		article.setM_ADDR(request.getParameter("M_ADDR"));
		article.setM_EMAIL(request.getParameter("M_EMAIL"));
		article.setM_GENDER(request.getParameter("M_GENDER"));
		System.out.println(request.getParameter("M_ID"));
		
		memberModifyService.modifyArticle(article);

		PageInfo pageInfo = new PageInfo();
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("article", article);
		forward = new ActionForward();
		forward.setPath("memberList.go");
		return forward;
	}

}