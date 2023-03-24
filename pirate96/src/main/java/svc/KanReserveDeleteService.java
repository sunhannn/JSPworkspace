package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.StudyDAO;

public class KanReserveDeleteService {

	public void deleteArticle(int r_num) throws Exception {

		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		int deleteCount = studyDAO.deleteArticle(r_num);

		if (deleteCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
	}

}
