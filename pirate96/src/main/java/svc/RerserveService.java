package svc;

import vo.MemberVO;
import vo.ReserveVO;
import dao.StudyDAO;
import static db.JdbcUtil.*;


import java.sql.*;

public class RerserveService {

	public boolean reserveResult(ReserveVO reserve) {
		boolean reserveSuccess = false;
		StudyDAO studyDAO = StudyDAO.getInstance();
		Connection con = getConnection();
		studyDAO.setConnection(con);
		int insertCount = studyDAO.insertMember(reserve);
		if (insertCount > 0) {
			reserveSuccess = true;
			commit(con);

		} else {
			rollback(con);
		}
		close(con);
		return reserveSuccess;
	}

}
