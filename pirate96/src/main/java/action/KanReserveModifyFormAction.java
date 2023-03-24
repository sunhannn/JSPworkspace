package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.ReserveModifyFormService;
import vo.ActionForward;
import vo.ReserveBean;

public class ReserveModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int reserve_num=Integer.parseInt(request.getParameter("r_num"));
			ReserveModifyFormService reserveModifyService
			= new ReserveModifyFormService();	
		   	ReserveBean article = reserveModifyService.getArticle(reserve_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/reserveList/reserveModify.jsp");
	   		return forward;
	   		
	 }
	 
}