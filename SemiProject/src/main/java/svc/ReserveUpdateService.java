package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.StudyDAO;
import vo.ReserveVO;

public class ReserveUpdateService {

	public boolean updateResult(ReserveVO reserve) {
		boolean updateSuccess = false;
		StudyDAO studyDAO = StudyDAO.getInstance();
		Connection con = getConnection();
		studyDAO.setConnection(con);
		int updateCount = studyDAO.updateReserve(reserve);
		if (updateCount > 0) {
			updateSuccess = true;
			commit(con);

		} else {
			rollback(con);
		}
		close(con);
		return updateSuccess;
	}
	
	
	
	
}
