package svc;

import static db.jdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import dao.ReserveDAO;
import vo.MemberBean;
import vo.ReserveBean;

public class MemberListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		listCount = memberDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<MemberBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<MemberBean> articleList = null;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		articleList = memberDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}
	
	
	//회원 검색 리스트 수 
	public int getSearchListCount(String list_search,String list_search_value) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		listCount = memberDAO.selectSearchListCount(list_search, list_search_value);
		close(con);
		return listCount;
		
	}
	
	
	
	//회원 검색 결과
	public ArrayList<MemberBean> getSearchArticleList(String list_search,String list_search_value,int page, int limit) throws Exception{
		
		ArrayList<MemberBean> articleList = null;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		articleList = memberDAO.selectSearchArticleList(list_search,list_search_value, page, limit);
		close(con);
		return articleList;
		
	}

}
