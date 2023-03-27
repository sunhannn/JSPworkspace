package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.StudyDAO;
import vo.ReserveVO;

public class KanReserveModifyService {

	public void modifyArticle(ReserveVO article) throws Exception {

		Connection con = getConnection();
		StudyDAO reserveDAO = StudyDAO.getInstance();
		reserveDAO.setConnection(con);
		int updateCount = reserveDAO.updateArticleReserve(article);
		System.out.println(updateCount);
		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

	}
}
