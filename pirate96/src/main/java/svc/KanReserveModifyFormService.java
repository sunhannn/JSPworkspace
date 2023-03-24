package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.ReserveDAO;
import dao.StudyDAO;
import vo.ReserveVO;

public class KanReserveModifyFormService {

//	public boolean isArticleWriter(int board_num, String pass) throws Exception {
//		// TODO Auto-generated method stub
//		
//		boolean isArticleWriter = false;
//		Connection con = getConnection();
//		BoardDAO boardDAO = BoardDAO.getInstance();
//		boardDAO.setConnection(con);
//		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
//		close(con);
//		return isArticleWriter;
//		
//	}

	// 해당 r_num(예약번호)인 것 가져옴
	public ReserveVO getArticle(int r_num) throws Exception {

		Connection con = getConnection();
		StudyDAO studyDAO = StudyDAO.getInstance();
		studyDAO.setConnection(con);
		ReserveVO reserveBean = studyDAO.getRnumArticle(r_num);

		close(con);
		return reserveBean;

	}

}
