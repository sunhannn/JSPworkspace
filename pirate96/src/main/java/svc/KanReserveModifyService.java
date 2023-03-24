package svc;

import static db.jdbcUtil.*;
import java.sql.Connection;

import dao.ReserveDAO;
import vo.ReserveBean;


public class ReserveModifyService {
	
	public void modifyArticle(ReserveBean article) throws Exception {
	
	Connection con = getConnection();
	ReserveDAO reserveDAO = ReserveDAO.getInstance();
	reserveDAO.setConnection(con);
	int updateCount = reserveDAO.updateArticle(article);
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


