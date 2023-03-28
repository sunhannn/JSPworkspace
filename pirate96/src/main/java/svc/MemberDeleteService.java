package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.StudyDAO;

public class MemberDeleteService {
//회원탈퇴

	public boolean deleteMember(String deleteId) {

		boolean deleteResult = false;
		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);

		int deleteCount = memberDAO.deleteMember(deleteId);
		if (deleteCount > 0) {

			commit(con);
			deleteResult = true;

		} else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}
}
