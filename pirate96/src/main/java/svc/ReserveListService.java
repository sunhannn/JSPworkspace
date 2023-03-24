package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StudyDAO;
import vo.ReserveVO;

public class ReserveListService {
	public ArrayList<ReserveVO> getMemberList() {
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);

		ArrayList<ReserveVO> reserveList = studyDAO.selectReserveList();
		close(con);
		return reserveList;

	}
}
