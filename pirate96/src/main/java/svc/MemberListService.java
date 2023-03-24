package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.StudyDAO;
import vo.MemberBean;
import vo.MemberVO;
import vo.ReserveVO;

public class MemberListService {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		listCount = studyDAO.selectListCount();
		close(con);
		return listCount;
		

	}

	public ArrayList<MemberVO> getArticleList(int page, int limit) throws Exception {

		ArrayList<MemberVO> articleList = null;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		articleList = studyDAO.selectArticleListMember(page, limit);
		close(con);
		return articleList;

	}

	// 회원 검색 리스트 수
	public int getSearchListCount(String list_search, String list_search_value) throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		listCount = studyDAO.selectSearchListCount(list_search, list_search_value);
		close(con);
		return listCount;

	}

	// 회원 검색 결과
	public ArrayList<MemberVO> getSearchArticleList(String list_search, String list_search_value, int page, int limit)
			throws Exception {

		ArrayList<MemberVO> articleList = null;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		articleList = studyDAO.selectSearchArticleListMember(list_search, list_search_value, page, limit);
		close(con);
		return articleList;

	}

}
