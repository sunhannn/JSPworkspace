package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberDeleteService;
import vo.ActionForward;
import vo.MemberVO;
import vo.PageInfo;

public class KanMemberDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		String m_id = request.getParameter("m_id");
		String nowPage = request.getParameter("page");
		MemberDeleteService memberDeleteService = new MemberDeleteService();
		MemberVO article = new MemberVO();
		memberDeleteService.deleteMember(m_id);

		PageInfo pageInfo = new PageInfo();
		request.setAttribute("pageInfo", pageInfo);
//		request.setAttribute("article", article);
		forward = new ActionForward();
		forward.setPath("memberList.go");
		return forward;
	}

}