package svc;

import static db.jdbcUtil.*;
import java.sql.Connection;

import dao.ReserveDAO;

public class ReserveDeleteService {


	public void deleteArticle(int r_num) throws Exception{
		
		Connection con = getConnection();
		ReserveDAO reserveDAO = ReserveDAO.getInstance();
		reserveDAO.setConnection(con);
		int deleteCount = reserveDAO.deleteArticle(r_num);
		
		if(deleteCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		close(con);
	}

}
