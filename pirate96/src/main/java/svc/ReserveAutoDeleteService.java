package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StudyDAO;
import vo.ReserveVO;

public class ReserveAutoDeleteService {

	public ArrayList<ReserveVO> autoDeleteReserve() {
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		ArrayList<ReserveVO> reserveList = studyDAO.selectReserveListToday();

		close(con);
		return reserveList;
	}
}
