package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudyDAO;
import vo.MemberVO;

public class ReserveMemberGoService {
	public MemberVO reserveMemCheck(String id) {
		Connection con = getConnection();
		StudyDAO dao = StudyDAO.getInstance();
		dao.setConnection(con);
		MemberVO member = dao.checkinfo(id);
		close(con);
		
		return member;
}
}
