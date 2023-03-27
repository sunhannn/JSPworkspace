package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.MemberDAO;
import dao.StudyDAO;

public class KanMemberDeleteService {

	public void deleteArticle(String m_id) throws Exception {

		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		int deleteCount = memberDAO.deleteMember(m_id);

		if (deleteCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
	}

}
