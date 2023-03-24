package svc;

import static db.jdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.ReserveDAO;
import vo.ReserveBean;

public class ReserveListService {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		listCount = reserveDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<ReserveBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<ReserveBean> articleList = null;
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		articleList = reserveDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}
	
	
	
	
	
	//검색 리스트 수 
	public int getSearchListCount(String list_search,String list_search_value) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		listCount = reserveDAO.selectSearchListCount(list_search, list_search_value);
		close(con);
		return listCount;
		
	}
	
	
	
	//검색
	public ArrayList<ReserveBean> getSearchArticleList(String list_search,String list_search_value,int page, int limit) throws Exception{
		
		ArrayList<ReserveBean> articleList = null;
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		articleList = reserveDAO.selectSearchArticleList(list_search,list_search_value, page, limit);
		close(con);
		return articleList;
		
	}


}
