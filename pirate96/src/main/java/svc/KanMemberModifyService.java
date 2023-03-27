package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.StudyDAO;
import vo.MemberVO;

public class KanMemberModifyService {

	public void modifyArticle(MemberVO article) throws Exception {

		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		int updateCount = memberDAO.updateArticle(article);
		System.out.println(updateCount);
		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

	}
}
