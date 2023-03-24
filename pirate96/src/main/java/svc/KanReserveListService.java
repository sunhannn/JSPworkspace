package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.StudyDAO;
import vo.BoardBean;
import vo.ReserveVO;

public class KanReserveListService {

	public int getListCount() throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		listCount = studyDAO.selectListCount();
		close(con);
		return listCount;

	}

	public ArrayList<ReserveVO> getArticleList(int page, int limit) throws Exception {

		ArrayList<ReserveVO> articleList = null;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		articleList = studyDAO.selectArticleListReserve(page, limit);
		close(con);
		return articleList;

	}

	// 검색 리스트 수
	public int getSearchListCount(String list_search, String list_search_value) throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		listCount = studyDAO.selectSearchListCount(list_search, list_search_value);
		close(con);
		return listCount;

	}

	// 검색
	public ArrayList<BoardBean> getSearchArticleList(String list_search, String list_search_value, int page, int limit)
			throws Exception {

		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		articleList = studyDAO.selectSearchArticleListReserve(list_search, list_search_value, page, limit);
		close(con);
		return articleList;

	}

}
