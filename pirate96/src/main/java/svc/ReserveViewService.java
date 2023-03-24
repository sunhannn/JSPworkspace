package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudyDAO;
import vo.ReserveVO;

public class ReserveViewService {
	public ReserveVO getReserve(int num) {
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		ReserveVO reserve = studyDAO.selectReserve(num);
		close(con);
		return reserve;

	}
}
