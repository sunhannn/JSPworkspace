package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import dao.StudyDAO;
import vo.ReserveVO;

public class ReserveDeleteService {
	public boolean deleteReserve(int deleteNum) {
		boolean deleteResult = false;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		ReserveVO reserve = studyDAO.selectReserve(deleteNum);
		int insertDel = studyDAO.insertDelReserve(reserve);
		int deleteCount = studyDAO.deleteReserve(deleteNum);
		if (deleteCount > 0 && insertDel > 0) {
			commit(con);
			deleteResult = true;

		} else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}

}
