package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CheckMyInfoService;
import vo.ActionForward;
import vo.Member;

public class CheckMyInfoAction  implements Action{
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("M_ID");
		
		
		
		Member member = new Member();
		
		member.setM_ID(id);
		System.out.println(member.getM_ID());
		ActionForward forward = null;
		
		
		
		
		
		
		CheckMyInfoService svc = new CheckMyInfoService();
		member = svc.checkinfo(member.getM_ID());
		request.setAttribute("member", member);
		forward = new ActionForward();
		forward.setPath("./myinfo.jsp");
		
		
		
		return forward;
	}

}
