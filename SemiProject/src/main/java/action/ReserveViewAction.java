package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;
import vo.ReserveVO;
import svc.ReserveViewService;



public class ReserveViewAction implements Action {
	
@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		int num= Integer.parseInt(request.getParameter("num"));
		ActionForward forward = null;
		
//		if (id == null) {
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("./main.jsp");
			
//		}else {
			forward = new ActionForward();
	   		int viewNum = num;
	   		ReserveViewService reserveViewService = new ReserveViewService();
	   		ReserveVO reserve =   reserveViewService.getReserve(viewNum);
	   		request.setAttribute("reserve", reserve);
	   		forward.setPath("./reserve_info.jsp");
	   		
			
			
//		}
		return forward;
	}
	
	
	
	
	
	
	
}
