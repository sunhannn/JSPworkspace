package svc;

import java.sql.Connection;
import dao.StudyDAO;
import vo.BoardVO;
import static db.JdbcUtil.*;

public class BoardDetailService {

	public BoardVO getArticle(int board_num) throws Exception {

		BoardVO article = null;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);

		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;

	}

}
