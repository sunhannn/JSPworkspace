package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.StudyDAO;
import vo.MemberVO;

public class CheckMyInfoService {
	// 내정보확인
	public MemberVO checkinfo(String id) {
		Connection con = getConnection();
		StudyDAO dao = StudyDAO.getInstance();
		dao.setConnection(con);
		MemberVO member = dao.checkinfo(id);
		close(con);

		return member;
	}
}
