package svc;

import java.sql.Connection;
import dao.StudyDAO;
import vo.BoardVO;
import static db.JdbcUtil.*;
public class BoardWriteProService {

	public boolean registArticle(BoardVO boardBean) throws Exception{
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
