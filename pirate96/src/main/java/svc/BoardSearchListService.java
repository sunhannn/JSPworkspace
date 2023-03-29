package svc;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;
import dao.StudyDAO;
import vo.BoardVO;

public class BoardSearchListService {


	//검색 리스트 수 
	public int getSearchListCount(String list_search,String list_search_value) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectSearchListCountBoard(list_search, list_search_value);
		close(con);
		return listCount;
		
	}
	
	
	
	//검색
	public ArrayList<BoardVO> getSearchArticleList(String list_search,String list_search_value,int page, int limit) throws Exception{
		
		ArrayList<BoardVO> articleList = null;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectSearchArticleListBoard(list_search,list_search_value, page, limit);
		close(con);
		return articleList;
		
	}


}