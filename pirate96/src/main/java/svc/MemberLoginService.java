package svc;

import vo.MemberVO;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.StudyDAO;
public class MemberLoginService {

	//로그인
	public boolean login(MemberVO member) {
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		
		boolean loginResult = false; 
		String loginId =studyDAO.selectLoginId(member);
		if(loginId != null) {loginResult = true;}
		close(con);
		return loginResult;
	}
}




