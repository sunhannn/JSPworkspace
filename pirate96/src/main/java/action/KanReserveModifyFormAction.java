package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.KanReserveModifyFormService;
import vo.ActionForward;
import vo.ReserveVO;

public class KanReserveModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int reserve_num=Integer.parseInt(request.getParameter("r_num"));
			KanReserveModifyFormService reserveModifyService
			= new KanReserveModifyFormService();	
		   	ReserveVO article = reserveModifyService.getArticle(reserve_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/reserveList/reserveModify.jsp");
	   		return forward;
	   		
	 }
	 
}