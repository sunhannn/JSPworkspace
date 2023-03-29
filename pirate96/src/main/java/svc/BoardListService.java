package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.StudyDAO;
import vo.BoardVO;

public class BoardListService {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;

	}

	public ArrayList<BoardVO> getArticleList(int page, int limit) throws Exception {

		ArrayList<BoardVO> articleList = null;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page, limit);
		close(con);
		return articleList;

	}

}
