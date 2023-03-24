package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.Member;

public class MemberUpdateService {
//내정보수정
	public boolean updateMember(String updateId,Member member) {
		
		boolean updateResult = false;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance(); //instance
		memberDAO.setConnection(con);
		
		int updateCount = memberDAO.updateMember(updateId,member); //뭘넣어야하니
		if(updateCount > 0) {
			
			commit(con);
			updateResult= true;
			
		}else {rollback(con);}
		close(con);
		return updateResult;
	}
}
