package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.StudyDAO;
import vo.MemberVO;

public class KanMemberModifyFormService {

	// 해당 id가 일치하는 것을 가져옴
	public MemberVO getArticle(String m_id) throws Exception {

		Connection con = getConnection();
		StudyDAO memberDAO = StudyDAO.getInstance();
		memberDAO.setConnection(con);
		MemberVO memberBean = memberDAO.getMIDArticle(m_id);

		close(con);
		return memberBean;

	}

}
