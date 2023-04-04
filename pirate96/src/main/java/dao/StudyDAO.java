package dao;

import static db.JdbcUtil.*;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardVO;
import vo.MemberVO;
import vo.ReserveVO;

public class StudyDAO {
	public static StudyDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private StudyDAO() {

	}

	public static StudyDAO getInstance() {
		if (instance == null) {
			instance = new StudyDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 관리자
	// ==========================================================================================
	// 전체 예약의 개수 구하기.
	public int selectListCountReserve() {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			System.out.println("getConnection");

			pstmt = con.prepareStatement("select count(*) from reserve");
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

	// 관리자 예약 검색
	// 예약 리스트 갯수 검색
	public int selectSearchListCountReserve(String list_search, String list_search_value) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_search_sql = null;
		try {
			if (list_search.equals("id")) {
				reserve_search_sql = "select count(*) from reserve where r_id like ?";
			} else if (list_search.equals("num")) {
				reserve_search_sql = "select count(*) from reserve where r_num=?";
			} else if (list_search.equals("name")) {
				reserve_search_sql = "select count(*) from reserve where r_name like ?";
			} else {
				reserve_search_sql = "select count(*) from reserve where r_ph like ?";
			}

			System.out.println("getConnection");
			pstmt = con.prepareStatement(reserve_search_sql);

			// 자료형 맞춰서 검색되도록 조건문 걸기
			if (list_search.equals("num")) {
				pstmt.setString(1, list_search_value);
			} else {
				pstmt.setString(1, "%" + list_search_value + "%");
			}
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

	// 관리자 예약 수정 폼에 넣기
	public ReserveVO getRnumArticle(int r_num) {
		ReserveVO reserve = new ReserveVO();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from reserve where r_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			rs = pstmt.executeQuery();

			// 가져온 값 reserveBean에 셋팅
			while (rs.next()) {
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_STIME(rs.getString("R_STIME"));
				reserve.setR_ETIME(rs.getString("R_ETIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));
			}

		} catch (Exception ex) {
			System.out.println("ReserveModifyselect 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return reserve;
	}

	// 관리자 예약 수정한 것 적용
	// 예약 수정.
	public int updateArticleReserve(ReserveVO article) {

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update reserve set r_name=?,r_stime=?,r_etime=?, r_pri=?, r_ph=?, r_room=? where r_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getR_NAME());
			pstmt.setString(2, article.getR_STIME());
			pstmt.setString(3, article.getR_ETIME());
			pstmt.setInt(4, article.getR_PRI());
			pstmt.setString(5, article.getR_PH());
			pstmt.setString(6, article.getR_ROOM());
			pstmt.setInt(7, article.getR_NUM());

			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("ReserveModify 에러 : " + ex);
		} finally {

			close(pstmt);
		}

		return updateCount;

	}

	// 관리자 예약 취소
	public int deleteArticleReserve(int r_num) {
		String reserve_delete_sql = "delete from reserve where R_NUM=?";

		PreparedStatement pstmt = null;
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(reserve_delete_sql);
			pstmt.setInt(1, r_num);
			deleteCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}

	// -------------------------------------------------------------------------------------------------
	// 관리자 전체 회원 수 구하기
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

	// 관리자 전체 회원 목록 보기
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

	// 관리자 회원 수정 폼
	// 선택한 멤버 id로 수정창에 넣을 정보 가져오기
	public MemberVO getMIDArticle(String m_id) {
		MemberVO member = new MemberVO();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member where m_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			// 가져온 값 memberBean에 셋팅
			while (rs.next()) {
				member.setM_ID(rs.getString("M_ID"));
				member.setM_PW(rs.getString("M_PW"));
				member.setM_NAME(rs.getString("M_NAME"));
				member.setM_PH(rs.getString("M_PH"));
				member.setM_ADDR(rs.getString("M_ADDR"));
				member.setM_EMAIL(rs.getString("M_EMAIL"));
				member.setM_GENDER(rs.getString("M_GENDER"));
			}

		} catch (Exception ex) {
			System.out.println("MemberModifyFormselect 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return member;
	}

	// 관리자 회원 수정 적용
	// 회원 수정.
	public int updateArticle(MemberVO article) {

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update member set m_name=?,m_ph=?, m_addr=?, m_email=?, m_gender=? where m_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getM_NAME());
			pstmt.setString(2, article.getM_PH());
			pstmt.setString(3, article.getM_ADDR());
			pstmt.setString(4, article.getM_EMAIL());
			pstmt.setString(5, article.getM_GENDER());
			pstmt.setString(6, article.getM_ID());

			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("MemberModify 에러 : " + ex);
		} finally {

			close(pstmt);
		}

		return updateCount;

	}

	// 관리자 회원 검색 리스트 갯수 검색
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

	// 관리자 검색 회원 목록 검색
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

	// 관리자 회원 삭제
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

	// 공지
	// ===================================================================================

	// 공지 글 등록
	public int insertArticle(BoardVO article) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement("select max(board_num) FROM BOARD");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into board (BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,";
			sql += "BOARD_CONTENT, BOARD_FILE,BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,SYSDATE)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_SUBJECT());
			pstmt.setString(4, article.getBOARD_CONTENT());
			pstmt.setString(5, article.getBOARD_FILE());
			pstmt.setInt(6, 0);

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("boardInsert 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	// 공지 전체 글의 갯수
	public int selectListCount() {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			System.out.println("getConnection");
			pstmt = con.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("BoardgetListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 공지 전체 글의 목록
	public ArrayList<BoardVO> selectArticleList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select * from (select rownum rnum, A.* from (select * from board order by BOARD_NUM desc ) A ) where rnum between ? and ?";
		ArrayList<BoardVO> articleList = new ArrayList<BoardVO>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 10 + 10;

		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				articleList.add(board);
			}

		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 공지 글 자세히 보기
	public BoardVO selectArticle(int board_num) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO boardBean = null;

		try {
			pstmt = con.prepareStatement("select * from board where BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardBean = new BoardVO();
				boardBean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardBean.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardBean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardBean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardBean.setBOARD_FILE(rs.getString("BOARD_FILE"));
				boardBean.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardBean.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
		} catch (Exception ex) {
			System.out.println("BoardgetDetail 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	// 공지 내용 수정 적용
	public int updateArticle(BoardVO article) {

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return updateCount;

	}

	// 공지 삭제
	public int deleteArticle(int board_num) {

		String board_file = "select BOARD_FILE FROM BOARD where BOARD_num=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_delete_sql = "delete FROM BOARD where BOARD_num=?";
		int deleteCount = 0;
		String filenm = "";

		try {
			pstmt = con.prepareStatement(board_file);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			rs.next();
			filenm = rs.getString("BOARD_FILE");

			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
			File file = new File("C:\\jspwork\\servletproject\\src\\main\\webapp\\boardUpload/" + filenm);
			if (file.exists()) {
				file.delete();
			}

		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}

	// 공지 조회수 업데이트.
	public int updateReadCount(int board_num) {

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update board set BOARD_READCOUNT = " + "BOARD_READCOUNT+1 where BOARD_NUM = " + board_num;

		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("boardsetReadCountUpdate 에러 : " + ex);
		} finally {
			close(pstmt);

		}

		return updateCount;

	}

	// 공지 작성자인지 확인
	public boolean isArticleBoardWriter(int board_num, String name) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_sql = "select * FROM BOARD where BOARD_NUM=?";
		boolean isWriter = false;

		try {
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			rs.next();

			if (name.equals(rs.getString("BOARD_NAME"))) {
				isWriter = true;
			}
		} catch (SQLException ex) {
			System.out.println("isBoardWriter 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return isWriter;

	}

	// 공지 글 검색 개수
	public int selectSearchListCountBoard(String list_search, String list_search_value) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_search_sql = null;
		try {
			if (list_search.equals("subject")) {
				board_search_sql = "select count(*) from board where board_subject like ?";
			} else if (list_search.equals("num")) {
				board_search_sql = "select count(*) from board where board_num=?";
			} else {
				board_search_sql = "select count(*) from board where board_name like ?";
			}

			pstmt = con.prepareStatement(board_search_sql);

			// 자료형 맞춰서 검색되도록 조건문 걸기
			if (list_search.equals("num")) {
				pstmt.setString(1, list_search_value);
			} else {
				pstmt.setString(1, "%" + list_search_value + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (Exception ex) {
			System.out.println("boardselectSearchListCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 공지 글 검색 목록
	public ArrayList<BoardVO> selectSearchArticleListBoard(String list_search, String list_search_value, int page,
			int limit) {

		ArrayList<BoardVO> articleList = new ArrayList<BoardVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_search_sql;
		try {
			if (list_search.equals("subject")) {
				board_search_sql = "select * from (select rownum rnum, A.* from (select * from BOARD where BOARD_SUBJECT like ? order by board_num desc) A ) where rnum between ? and ?";
			} else if (list_search.equals("num")) {
				board_search_sql = "select * from (select rownum rnum, A.* from (select * from BOARD where BOARD_num in ? order by board_num desc) A ) where rnum between ? and ?";
			} else {
				board_search_sql = "select * from (select rownum rnum, A.* from (select * from BOARD where BOARD_name like ? order by board_num desc) A ) where rnum between ? and ?";
			}

			int startrow = (page - 1) * 10 + 1;
			int endrow = (page - 1) * 10 + 10;
			pstmt = con.prepareStatement(board_search_sql);

			if (list_search.equals("num")) {
				pstmt.setString(1, list_search_value);
			} else {
				pstmt.setString(1, "%" + list_search_value + "%");
			}
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO boradbean = new BoardVO();
				boradbean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boradbean.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boradbean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));

				articleList.add(boradbean);

			}
		} catch (Exception ex) {
			System.out.println("boardselectSearchArticleList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 개인(ID)로 확인할 수 있는 목록들
	// ========================================================================
	// 내 정보 확인
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

	// 중복 판단용 같은 날짜 정보 전부 가져오기
	public ArrayList<ReserveVO> joongbokPandan(String date) {
		String sql = "SELECT * FROM reserve where r_date = ?";
		ArrayList<ReserveVO> reserveList = new ArrayList<ReserveVO>();
		ReserveVO reserve = null;
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					reserve = new ReserveVO();
					reserve.setR_NUM(rs.getInt("R_NUM"));
					reserve.setR_ID(rs.getString("R_ID"));
					reserve.setR_NAME(rs.getString("R_NAME"));
					reserve.setR_DATE(rs.getString("R_DATE"));
					reserve.setR_STIME(rs.getString("R_STIME"));
					reserve.setR_ETIME(rs.getString("R_ETIME"));
					reserve.setR_PRI(rs.getInt("R_PRI"));
					reserve.setR_PH(rs.getString("R_PH"));
					reserve.setR_ROOM(rs.getString("R_ROOM"));
					reserveList.add(reserve);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("getDeatilReserve 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return reserveList;
	}

	// 아이디 중복검사 아약스
	public boolean idCheck(MemberVO member) {
		if (member.getM_ID() == null || member.getM_ID().length() == 0) {
			System.out.println("아이디가 없습니다.");
		}
		boolean idchk = false;
		String SQL = "select count(*) as result from MEMBER where M_ID = ? ";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, member.getM_ID());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int result = rs.getInt(1);
				if (result > 0)
					idchk = true;
			}
			return idchk;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idchk;
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

	// 예약 정보 추가
	public int insertMember(ReserveVO reserve) {
		String sql = "INSERT INTO RESERVE VALUES (SEQ_RENUM.nextval,?,?,?,?,?,?,?,?)";
		int insertCount = 0;

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserve.getR_ID());
			pstmt.setString(2, reserve.getR_NAME());
			pstmt.setString(3, reserve.getR_DATE());
			pstmt.setString(4, reserve.getR_STIME());
			pstmt.setString(5, reserve.getR_ETIME());
			pstmt.setInt(6, reserve.getR_PRI());
			pstmt.setString(7, reserve.getR_PH());
			pstmt.setString(8, reserve.getR_ROOM());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("reserve 에러: " + ex);
		} finally {
			close(pstmt);

		}

		return insertCount;
	}

	// 예약 번호를 이용한 한줄 정보 조회
	public ReserveVO selectReserve(int NUM) {
		String sql = "SELECT * FROM reserve WHERE R_NUM=?";
		ReserveVO reserve = null;
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, NUM);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				reserve = new ReserveVO();
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_DATE(rs.getString("R_DATE"));
				reserve.setR_STIME(rs.getString("R_STIME"));
				reserve.setR_ETIME(rs.getString("R_ETIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));
			}
		} catch (Exception ex) {
			System.out.println("SelectMember 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);

		}

		return reserve;
	}

	// 임시 삭제 정보 보관 테이블
	public int insertDelReserve(ReserveVO reserve) {
		String sql = "INSERT INTO RESERVE_del VALUES (?,?,?,?,?,?,?,?,?)";
		int insertCount = 0;

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserve.getR_NUM());
			pstmt.setString(2, reserve.getR_ID());
			pstmt.setString(3, reserve.getR_NAME());
			pstmt.setString(4, reserve.getR_DATE());
			pstmt.setString(5, reserve.getR_STIME());
			pstmt.setString(6, reserve.getR_ETIME());
			pstmt.setInt(7, reserve.getR_PRI());
			pstmt.setString(8, reserve.getR_PH());
			pstmt.setString(9, reserve.getR_ROOM());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("reserve 에러: " + ex);
		} finally {
			close(pstmt);

		}

		return insertCount;
	}

	// 예약 정보 삭제
	public int deleteReserve(int num) {
		String sql = "DELETE reserve WHERE r_num = ?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteMember 에러: " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	// ID로 예약 테이블 전체 정보 가져오기
	public ArrayList<ReserveVO> selectReserveList(String id) {
		String sql = "SELECT * FROM reserve where r_id = ?";
		ArrayList<ReserveVO> reserveList = new ArrayList<ReserveVO>();
		ReserveVO reserve = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					reserve = new ReserveVO();
					reserve.setR_NUM(rs.getInt("R_NUM"));
					reserve.setR_ID(rs.getString("R_ID"));
					reserve.setR_NAME(rs.getString("R_NAME"));
					reserve.setR_DATE(rs.getString("R_DATE"));
					reserve.setR_STIME(rs.getString("R_STIME"));
					reserve.setR_ETIME(rs.getString("R_ETIME"));
					reserve.setR_PRI(rs.getInt("R_PRI"));
					reserve.setR_PH(rs.getString("R_PH"));
					reserve.setR_ROOM(rs.getString("R_ROOM"));
					reserveList.add(reserve);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("getDeatilReserve 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return reserveList;
	}

	// 본인 예약 정보 수정
	public int updateReserve(ReserveVO reserve) {
		String sql = "UPDATE reserve set r_date = ?, r_stime = ?, r_etime = ?,r_pri = ? , r_room = ? where r_num = ?";
		int updateCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserve.getR_DATE());
			pstmt.setString(2, reserve.getR_STIME());
			pstmt.setString(3, reserve.getR_ETIME());
			pstmt.setInt(4, reserve.getR_PRI());
			pstmt.setString(5, reserve.getR_ROOM());
			pstmt.setInt(6, reserve.getR_NUM());
			updateCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	// 예약 리스트 보기 (업데이트 버전)
	public ArrayList<ReserveVO> selectArticleListReserveJjin(int page, int limit, String id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_list_sql = "select * from (select rownum rnum, A.* from (select * from reserve r_NUM order by r_num desc) A ) where r_id = ? and rnum between ? and ?";
		ArrayList<ReserveVO> articleList = new ArrayList<ReserveVO>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;
		try {
			pstmt = con.prepareStatement(reserve_list_sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReserveVO reserve = new ReserveVO();
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_STIME(rs.getString("R_STIME"));
				reserve.setR_ETIME(rs.getString("R_ETIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));

				articleList.add(reserve);
			}

		} catch (Exception ex) {
			System.out.println("getReserveList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 아이디로 검색해서 갯수 구하기
	public int selectListCountReserveJjin(String id) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			System.out.println("getConnection");

			pstmt = con.prepareStatement("select count(*) from reserve where r_id = ?");
			pstmt.setString(1, id);
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

	// ID로 예약 테이블 전체 정보 가져오기
	public ArrayList<ReserveVO> selectReserveListToday() {
		String sql = "SELECT * FROM reserve";
		ArrayList<ReserveVO> reserveList = new ArrayList<ReserveVO>();
		ReserveVO reserve = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					reserve = new ReserveVO();
					reserve.setR_NUM(rs.getInt("R_NUM"));
					reserve.setR_ID(rs.getString("R_ID"));
					reserve.setR_NAME(rs.getString("R_NAME"));
					reserve.setR_DATE(rs.getString("R_DATE"));
					reserve.setR_STIME(rs.getString("R_STIME"));
					reserve.setR_ETIME(rs.getString("R_ETIME"));
					reserve.setR_PRI(rs.getInt("R_PRI"));
					reserve.setR_PH(rs.getString("R_PH"));
					reserve.setR_ROOM(rs.getString("R_ROOM"));
					reserveList.add(reserve);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("getDeatilReserve 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return reserveList;
	}

	public int deleteAutoReserve(int num) {
		String reserve_delete_sql = "delete from reserve where R_NUM=?";

		PreparedStatement pstmt = null;
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(reserve_delete_sql);
			pstmt.setInt(1, num);
			deleteCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}

	// 전체 예약 목록 보기
	public ArrayList<ReserveVO> selectArticleListReserve(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_list_sql = "select * from (select rownum rnum, A.* from (select * from reserve r_NUM order by r_num desc) A ) where rnum between ? and ?";
		ArrayList<ReserveVO> articleList = new ArrayList<ReserveVO>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;
		try {
			pstmt = con.prepareStatement(reserve_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReserveVO reserve = new ReserveVO();
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_STIME(rs.getString("R_STIME"));
				reserve.setR_ETIME(rs.getString("R_ETIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));
				reserve.setR_DATE(rs.getString("R_DATE"));

				articleList.add(reserve);
			}

		} catch (Exception ex) {
			System.out.println("getReserveList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	public ArrayList<ReserveVO> selectSearchArticleList(String list_search, String list_search_value, int page,
			int limit) {

		ArrayList<ReserveVO> articleList = new ArrayList<ReserveVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_search_sql;
		try {
			if (list_search.equals("id")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_id like ? order by r_num desc) A ) where rnum between ? and ?";
			} else if (list_search.equals("num")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_num in ? order by r_num desc) A ) where rnum between ? and ?";
			} else if (list_search.equals("name")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_name like ? order by r_num desc) A ) where rnum between ? and ?";
			} else {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_ph like ? order by r_num desc) A ) where rnum between ? and ?";
			}

			int startrow = (page - 1) * 10 + 1;
			int endrow = (page - 1) * 10 + 10;

			pstmt = con.prepareStatement(reserve_search_sql);

			// 자료형 맞춰서 검색되도록 조건문 걸기
			if (list_search.equals("num")) {
				pstmt.setString(1, list_search_value);
			} else {
				pstmt.setString(1, "%" + list_search_value + "%");
			}
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReserveVO reserve = new ReserveVO();
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_STIME(rs.getString("R_STIME"));
				reserve.setR_ETIME(rs.getString("R_ETIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));
				reserve.setR_DATE(rs.getString("R_DATE"));

				articleList.add(reserve);
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
