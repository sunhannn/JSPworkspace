package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberVO;

public class CheckMyInfoService {
	//내정보확인
	public MemberVO checkinfo(String id) {
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		MemberVO member = dao.checkinfo(id);
		close(con);
		
		return member;
}
	}
