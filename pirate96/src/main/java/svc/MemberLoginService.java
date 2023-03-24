package svc;

import vo.Member;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
public class MemberLoginService {

	//로그인
	public boolean login(Member member) {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		boolean loginResult = false; 
		String loginId =memberDAO.selectLoginId(member);
		if(loginId != null) {loginResult = true;}
		close(con);
		return loginResult;
	}
}




