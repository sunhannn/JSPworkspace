package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.StudyDAO;
import vo.ReserveVO;


public class KanReserveModifyService {
	
	public void modifyArticle(ReserveVO article) throws Exception {
	
	Connection con = getConnection();
	StudyDAO studyDAO = StudyDAO.getInstance();
	studyDAO.setConnection(con);
	int updateCount = studyDAO.updateArticle(article);
	System.out.println(updateCount);
	if(updateCount > 0){
		commit(con);
	}
	else{
		rollback(con);
	}
	
	close(con);

	
	}
}


