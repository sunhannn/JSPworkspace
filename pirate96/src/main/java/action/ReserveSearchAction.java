package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.KanReserveListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class ReserveSearchAction implements Action  {

public ActionForward execute(HttpServletRequest request,HttpServletResponse response)
		throws Exception{
	
	ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
  	int page=1;
	int limit=10;

	
	//검색 시 사용한 카테고리, 검색 값 받아오기
	String list_search = request.getParameter("search");
	String list_search_value =  request.getParameter("search_value");
	
	
	if(request.getParameter("page")!=null ){
		page=Integer.parseInt(request.getParameter("page"));
	}
	

	
	KanReserveListService reserveListService = new KanReserveListService();
	int listCount=reserveListService.getSearchListCount(list_search,list_search_value); //총 리스트 수를 받아옴.
	articleList = reserveListService.getSearchArticleList(list_search,list_search_value,page,limit); //리스트를 받아옴.
	
	//총 페이지 수.
		int maxPage=(int)((double)listCount/limit+0.95); 
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	        int endPage = startPage+10-1;

		if (endPage> maxPage) endPage= maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
	pageInfo.setMaxPage(maxPage);
	pageInfo.setPage(page);
	pageInfo.setStartPage(startPage);	
	request.setAttribute("pageInfo", pageInfo);
	request.setAttribute("articleList", articleList);
	ActionForward forward= new ActionForward();
    forward.setPath("/board/search_board_list.jsp");
		return forward;

}
}
	
