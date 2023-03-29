package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.KanMemberModifyFormService;
import vo.ActionForward;
import vo.MemberVO;

public class KanMemberModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			String m_id=request.getParameter("m_id");
			KanMemberModifyFormService memberModifyService = new KanMemberModifyFormService();	
			MemberVO article = memberModifyService.getArticle(m_id);
		   	request.setAttribute("article", article);
	   		forward.setPath("/memberList/memberModify.jsp");
	   		return forward;
	   		
	 }
	 
}