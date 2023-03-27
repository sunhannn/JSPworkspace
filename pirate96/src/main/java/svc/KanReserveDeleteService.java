package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.StudyDAO;

public class KanReserveDeleteService {

	public void deleteArticle(int r_num) throws Exception {

		Connection con = getConnection();
		StudyDAO reserveDAO = StudyDAO.getInstance();
		reserveDAO.setConnection(con);
		int deleteCount = reserveDAO.deleteArticleReserve(r_num);

		if (deleteCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
	}

}
