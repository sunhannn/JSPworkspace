package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReserveModifyFormService;
import svc.ReserveModifyService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReserveBean;

public class ReserveModifyAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	
		 	ActionForward forward = null;
		 	int r_num=Integer.parseInt(request.getParameter("R_NUM"));
			int r_pri=Integer.parseInt(request.getParameter("R_PRI"));
			ReserveBean article=new ReserveBean();
			ReserveModifyService reserveModifyService = new ReserveModifyService();
	   		
			// 수정한 값들 받아서 reserveBean에 셋팅
			article.setR_NUM(r_num);
			article.setR_PRI(r_pri);
			article.setR_NAME(request.getParameter("R_NAME"));
			article.setR_ID(request.getParameter("R_ID"));
			article.setR_TIME(request.getParameter("R_TIME"));
			article.setR_PH(request.getParameter("R_PH"));
			article.setR_ROOM(request.getParameter("R_ROOM"));
			
			reserveModifyService.modifyArticle(article);
			
			PageInfo pageInfo = new PageInfo();
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("article", article);
			forward = new ActionForward();
			forward.setPath("/reserveList/reserveModifySuccess.jsp"); 
			 return forward;
	 }
	 
	
	 
}