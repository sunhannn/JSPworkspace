package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class CheckMyInfoService {
	//내정보확인
	public Member checkinfo(String id) {
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		Member member = dao.checkinfo(id);
		close(con);
		
		return member;
}
	}
