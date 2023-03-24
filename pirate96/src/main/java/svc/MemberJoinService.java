package svc;

import static db.JdbcUtil.*;



import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class MemberJoinService {

		//회원가입
		public boolean joinMember(Member member) {
			boolean joinSuccess = false;
			MemberDAO memberDAO = MemberDAO.getInstance();
			Connection con = getConnection();
			memberDAO.setConnection(con);
			
			int insertCount = memberDAO.insertMember(member);

			if(insertCount > 0) {
				joinSuccess = true;
				commit(con);
			}
			else{rollback(con);}
			close(con);
			return joinSuccess;
		}
	}

