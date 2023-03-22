package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StudyDAO;
import vo.ReserveVO;

public class JoongbokService {
	
	public ArrayList<ReserveVO> reserveCheck(String date) {
		
		
		StudyDAO studyDAO = StudyDAO.getInstance();
		Connection con = getConnection();
		studyDAO.setConnection(con);
		ArrayList<ReserveVO> reserveList = studyDAO.joongbokPandan(date);
		
		
		
		
		
		close(con);
		return reserveList;
	}
	
	
	
	
}
