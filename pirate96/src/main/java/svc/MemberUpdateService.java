package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.StudyDAO;
import vo.MemberVO;

public class MemberUpdateService {
//내정보수정
	public boolean updateMember(String updateId,MemberVO member) {
		
		boolean updateResult = false;
		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance(); //instance
		studyDAO.setConnection(con);
		
		int updateCount = studyDAO.updateMember(updateId,member); //뭘넣어야하니
		if(updateCount > 0) {
			
			commit(con);
			updateResult= true;
			
		}else {rollback(con);}
		close(con);
		return updateResult;
	}
}
