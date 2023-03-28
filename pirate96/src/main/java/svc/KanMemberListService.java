package svc;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import dao.StudyDAO;
import vo.MemberVO;
import vo.ReserveVO;

public class KanMemberListService {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		listCount = memberDAO.selectListCount();
		close(con);
		return listCount;

	}

	public ArrayList<MemberVO> getArticleList(int page, int limit) throws Exception {

		ArrayList<MemberVO> articleList = null;
		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		articleList = memberDAO.selectArticleListMember(page, limit);
		close(con);
		return articleList;

	}

	// 회원 검색 리스트 수
	public int getSearchListCount(String list_search, String list_search_value) throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		listCount = memberDAO.selectSearchListCountMember(list_search, list_search_value);
		close(con);
		return listCount;

	}

	// 회원 검색 결과
	public ArrayList<MemberVO> getSearchArticleList(String list_search, String list_search_value, int page, int limit)
			throws Exception {

		ArrayList<MemberVO> articleList = null;
		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		articleList = memberDAO.selectSearchArticleListMember(list_search, list_search_value, page, limit);
		close(con);
		return articleList;

	}

}
