package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class MemberListService {

	public ArrayList<MemberBean> getMemberList() {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);

		ArrayList<MemberBean> memberList = memberDAO.selectMemberList();
		close(con);
		return memberList;

	}

}
