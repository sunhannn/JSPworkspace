package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;

public class MemberDAO {
	public static MemberDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private MemberDAO() {

	}

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 로그인
	public String selectLoginId(MemberVO member) {
		String loginId = null;
		String sql = "SELECT M_ID FROM MEMBER WHERE M_ID=? AND M_PW=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				loginId = rs.getString("M_ID");
				System.out.println("loginId: " + loginId);
			}
		} catch (Exception ex) {
			System.out.println(" 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return loginId;
	}

	// 회원가입
	public int insertMember(MemberVO member) {
		String sql = "INSERT INTO MEMBER (M_ID,M_PW,M_NAME,M_PH,M_ADDR,M_EMAIL,M_GENDER) VALUES (?,?,?,?,?,?,?)";
		int insertCount = 0;

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			pstmt.setString(3, member.getM_NAME());
			pstmt.setString(4, member.getM_PH());
			pstmt.setString(5, member.getM_ADDR());
			pstmt.setString(6, member.getM_EMAIL());
			pstmt.setString(7, member.getM_GENDER());

			insertCount = pstmt.executeUpdate();
			System.out.println("insertCount: " + insertCount);

			if (insertCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException ex) {

		} finally {
			close(pstmt);
		}

		return insertCount;
	}

	// 회원탈퇴
	public int deleteMember(String deleteId) {

		String sql = "DELETE FROM MEMBER WHERE M_ID=?";
		int deleteCount = 0;

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteMember 에러: " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	// 내정보수정
	public int updateMember(String updateId, MemberVO member) {
		String sql = "update member set M_ID=?,M_PW=?,M_NAME=?,M_PH=?,M_ADDR=?,M_EMAIL=?,M_GENDER=? WHERE M_ID=?";
		int updateCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID()); // 원래있던 id
			pstmt.setString(2, member.getM_PW());
			pstmt.setString(3, member.getM_NAME());
			pstmt.setString(4, member.getM_PH());
			pstmt.setString(5, member.getM_ADDR());
			pstmt.setString(6, member.getM_EMAIL());
			pstmt.setString(7, member.getM_GENDER());
			pstmt.setString(8, updateId);
			updateCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("updateMember 에러: " + ex);

		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	// 내정보확인
	public MemberVO selectMember(String id) {
		String sql = "SELECT * FROM MEMBER WHERE M_ID=?";
		MemberVO member = null;
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberVO();
				member.setM_ID(rs.getString("M_ID"));

			}
		} catch (Exception ex) {
			System.out.println("getMemberinfo 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return member;
	}

	// 내정보확인
	public MemberVO checkinfo(String id) {
		String sql = "select * from member where M_ID = ?";
		MemberVO member = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setM_ID(rs.getString("M_ID"));
				member.setM_PW(rs.getString("M_PW"));
				member.setM_NAME(rs.getString("M_NAME"));
				member.setM_PH(rs.getString("M_PH"));
				member.setM_ADDR(rs.getString("M_ADDR"));
				member.setM_EMAIL(rs.getString("M_EMAIL"));
				member.setM_GENDER(rs.getString("M_GENDER"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return member;
	}

	// 회원의 수 구하기.
	public int selectListMember() {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			System.out.println("getConnection");

			pstmt = con.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 회원목록 보기
	public ArrayList<MemberVO> selectArticleListMember(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_list_sql = "select * from (select rownum rnum, A.* from (select * from member) A ) where rnum between ? and ?";
//				String reserve_list_sql="select * from reserve where r_num between ? and ?";
		ArrayList<MemberVO> articleList = new ArrayList<MemberVO>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;
		try {
			pstmt = con.prepareStatement(reserve_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO membere = new MemberVO();
				membere.setM_ID(rs.getString("M_ID"));
				membere.setM_PW(rs.getString("M_PW"));
				membere.setM_NAME(rs.getString("M_NAME"));
				membere.setM_PH(rs.getString("M_PH"));
				membere.setM_ADDR(rs.getString("M_ADDR"));
				membere.setM_EMAIL(rs.getString("M_EMAIL"));
				membere.setM_GENDER(rs.getString("M_GENDER"));

				articleList.add(membere);
			}

		} catch (Exception ex) {
			System.out.println("getReserveList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 회원 검색 리스트 갯수 검색
	public int selectSearchListCountMember(String list_search, String list_search_value) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String member_search_sql = null;
		try {

			if (list_search.equals("id")) {
				member_search_sql = "select count(*) from member where m_id like ?";
			} else if (list_search.equals("name")) {
				member_search_sql = "select count(*) from member where m_name like ?";
			} else if (list_search.equals("ph")) {
				member_search_sql = "select count(*) from member where m_ph like ?";
			} else if (list_search.equals("addr")) {
				member_search_sql = "select count(*) from member where m_addr like ?";
			} else if (list_search.equals("email")) {
				member_search_sql = "select count(*) from member where m_email like ?";
			} else {
				member_search_sql = "select count(*) from member where m_gender like ?";
			}

			System.out.println("getConnection");

			pstmt = con.prepareStatement(member_search_sql);
			pstmt.setString(1, "%" + list_search_value + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (Exception ex) {
			System.out.println("selectSearchListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 회원목록 검색
	public ArrayList<MemberVO> selectSearchArticleListMember(String list_search, String list_search_value, int page,
			int limit) {

		ArrayList<MemberVO> articleList = new ArrayList<MemberVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_search_sql;
		try {
			if (list_search.equals("id")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_id like ?) A ) where rnum between ? and ?";
			} else if (list_search.equals("name")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_name like ?) A ) where rnum between ? and ?";
			} else if (list_search.equals("ph")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_ph like ?) A ) where rnum between ? and ?";
			} else if (list_search.equals("addr")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_addr like ?) A ) where rnum between ? and ?";
			} else if (list_search.equals("email")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_email like ?) A ) where rnum between ? and ?";
			} else {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_gender like ?) A ) where rnum between ? and ?";
			}

//						ArrayList<ReserveBean> articleList = new ArrayList<ReserveBean>();
			int startrow = (page - 1) * 10 + 1;
			int endrow = (page - 1) * 10 + 10;

			pstmt = con.prepareStatement(reserve_search_sql);
			pstmt.setString(1, "%" + list_search_value + "%");
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO member = new MemberVO();
				member.setM_ID(rs.getString("M_ID"));
				member.setM_PW(rs.getString("M_PW"));
				member.setM_NAME(rs.getString("M_NAME"));
				member.setM_PH(rs.getString("M_PH"));
				member.setM_ADDR(rs.getString("M_ADDR"));
				member.setM_EMAIL(rs.getString("M_EMAIL"));
				member.setM_GENDER(rs.getString("M_GENDER"));
				articleList.add(member);
			}

		} catch (Exception ex) {
			System.out.println("selectSearchArticleList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
	
	
	
	
	
	
}
