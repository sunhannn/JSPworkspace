package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import vo.ReserveVO;
import vo.ActionForward;
import svc.ReserveListService;

public class ReserveListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = null;
		
		
//		if (id == null) {
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("main.jsp");
//		} else {
			forward = new ActionForward();
			ReserveListService reserveListService = new ReserveListService();
			ArrayList<ReserveVO> reserveList = reserveListService.getMemberList();

			request.setAttribute("reserveList", reserveList);
			
			forward.setPath("./reserveList.jsp");
			

//		}
		return forward;
	}

}
