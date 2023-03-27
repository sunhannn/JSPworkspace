package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberVO;

public class ReserveMemberGoService {
	public MemberVO reserveMemCheck(String id) {
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		MemberVO member = dao.checkinfo(id);
		close(con);
		
		return member;
}
}
