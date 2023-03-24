//package action;
//
//import java.io.PrintWriter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import svc.BoardDeleteProService;
//import vo.ActionForward;
//
//public class BoardDeleteProAction implements Action {
//
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//		ActionForward forward = null;
//		int board_num = Integer.parseInt(request.getParameter("board_num"));
//		String nowPage = request.getParameter("page");
//		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
//		boolean isArticleWriter = boardDeleteProService.isArticleWriter(board_num, request.getParameter("BOARD_NAME"));
//
//		if (!isArticleWriter) {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('작성자가 잘못됐습니다.');");
//			out.println("history.back();");
//			out.println("</script>");
//			out.close();
//		}
//
//		else {
//
//			boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);
//
//			if (!isDeleteSuccess) {
//				response.setContentType("text/html;charset=UTF-8");
//				PrintWriter out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('삭제실패');");
//				out.println("history.back();");
//				out.println("</script>");
//				out.close();
//			} else {
//				forward = new ActionForward();
//				forward.setRedirect(true);
//				forward.setPath("boardList.go?page=" + nowPage);
//			}
//
//		}
//		return forward;
//	}
//
//}
package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String nowPage = request.getParameter("page");
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);
		

			if (!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.go?page=" + nowPage);
			}

		
		return forward;
}

}