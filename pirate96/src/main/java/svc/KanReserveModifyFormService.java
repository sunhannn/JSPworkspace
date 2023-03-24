package svc;

import static db.jdbcUtil.*;
import java.sql.Connection;

import dao.ReserveDAO;
import vo.ReserveBean;


public class ReserveModifyFormService {

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
	
	//해당 r_num(예약번호)인 것 가져옴 
	public ReserveBean getArticle(int r_num) throws Exception {
		
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		ReserveBean reserveBean = reserveDAO.getRnumArticle(r_num);

		
		close(con);
		return reserveBean;
		
	}

}
