package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.ReserveDeleteService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReserveBean;

public class ReserveDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String nowPage = request.getParameter("page");
		ReserveDeleteService reserveDeleteService = new ReserveDeleteService();
		ReserveBean article=new ReserveBean();
		reserveDeleteService.deleteArticle(r_num);
		
		PageInfo pageInfo = new PageInfo();
		request.setAttribute("pageInfo", pageInfo);
//		request.setAttribute("article", article);
		forward = new ActionForward();
		forward.setPath("/reserveList/reserve_list.jsp"); 
		 return forward;
	}

}