package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.StudyDAO;
import vo.ReserveVO;

import static db.JdbcUtil.*;

public class KanReserveListService {

	public int getListCount() throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO reserveDAO = StudyDAO.getInstance();
		reserveDAO.setConnection(con);
		listCount = reserveDAO.selectListCountReserve();
		close(con);
		return listCount;

	}

	public ArrayList<ReserveVO> getArticleList(int page, int limit) throws Exception {

		ArrayList<ReserveVO> articleList = null;
		Connection con = getConnection();
		StudyDAO reserveDAO = StudyDAO.getInstance();
		reserveDAO.setConnection(con);
		articleList = reserveDAO.selectArticleListReserve(page, limit);
		close(con);
		return articleList;

	}

	// 검색 리스트 수
	public int getSearchListCount(String list_search, String list_search_value) throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		StudyDAO reserveDAO = StudyDAO.getInstance();
		reserveDAO.setConnection(con);
		listCount = reserveDAO.selectSearchListCountReserve(list_search, list_search_value);
		close(con);
		return listCount;

	}

	// 검색
	public ArrayList<ReserveVO> getSearchArticleList(String list_search, String list_search_value, int page, int limit)
			throws Exception {

		ArrayList<ReserveVO> articleList = null;
		Connection con = getConnection();
		StudyDAO reserveDAO = StudyDAO.getInstance();
		reserveDAO.setConnection(con);
		articleList = reserveDAO.selectSearchArticleList(list_search, list_search_value, page, limit);
		close(con);
		return articleList;

	}
}
