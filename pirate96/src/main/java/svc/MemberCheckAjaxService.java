package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.StudyDAO;
import vo.MemberVO;

public class MemberCheckAjaxService {

	public boolean loginCheck(MemberVO member) {
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		boolean loginJoongbok = false;
		loginJoongbok = studyDAO.idCheck(member);

		return loginJoongbok;
	}

}
