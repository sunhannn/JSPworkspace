package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;
import vo.MemberBean;

public class MemberViewService {

	public MemberBean getMember(String viewId) {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		MemberBean member = memberDAO.selectMember(viewId);
		close(con);
		return member;

	}

}
