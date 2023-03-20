package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudyDAO;
import vo.ReserveVO;

public class ReserveViewService {
	public ReserveVO getMember(String viewId) {
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);

		ReserveVO reserve = studyDAO.selectReserve(viewId);
		close(con);
		return reserve;

	}
}
