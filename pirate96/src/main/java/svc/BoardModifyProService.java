package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.BoardVO;
import dao.StudyDAO;

public class BoardModifyProService {

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(BoardVO article) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		StudyDAO boardDAO = StudyDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
