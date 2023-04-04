package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.StudyDAO;

public class ReserveAutoServiceGOGO {
	public boolean deleteReserve(int deleteNum) {
		boolean deleteResult = false;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		int deleteCount = studyDAO.deleteReserve(deleteNum);
		if (deleteCount > 0) {
			commit(con);
			deleteResult = true;

		} else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}
}
