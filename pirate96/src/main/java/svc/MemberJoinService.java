package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.StudyDAO;
import vo.MemberVO;

public class MemberJoinService {

	// 회원가입
	public boolean joinMember(MemberVO member) {
		boolean joinSuccess = false;
		StudyDAO memberDAO = StudyDAO.getInstance();
		Connection con = getConnection();
		memberDAO.setConnection(con);

		int insertCount = memberDAO.insertMember(member);

		if (insertCount > 0) {
			joinSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
}
