package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.MemberVO;
import vo.ReserveVO;

public class ReserveDAO {
	public static ReserveDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private ReserveDAO() {

	}

	public static ReserveDAO getInstance() {
		if (instance == null) {
			instance = new ReserveDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 예약 정보 추가
	public int insertMember(ReserveVO reserve, MemberVO member) {
		String sql = "INSERT INTO RESERVE VALUES (SEQ_RENUM.nextval,?,?,?,?,?,?,?,?)";
		int insertCount = 0;

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_NAME());
			pstmt.setString(3, reserve.getR_DATE());
			pstmt.setString(4, reserve.getR_STIME());
			pstmt.setString(5, reserve.getR_ETIME());
			pstmt.setInt(6, reserve.getR_PRI());
			pstmt.setString(7, member.getM_PH());
			pstmt.setString(8, reserve.getR_ROOM());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("reserve 에러: " + ex);
		} finally {
			close(pstmt);

		}

		return insertCount;
	}

	// 멤버 테이블 정보 가져오기
	public MemberVO selectMembers(String id) {
		String sql = "SELECT * FROM MEMBER WHERE M_ID=?";
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
			}
		} catch (Exception ex) {
			System.out.println("SelectMember 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);

		}

		return member;
	}

	// 예약 테이블 전체 정보 가져오기
	public ArrayList<ReserveVO> selectReserveList() {
		String sql = "SELECT * FROM reserve where r_id = ?";
		ArrayList<ReserveVO> reserveList = new ArrayList<ReserveVO>();
		ReserveVO reserve = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "leo");
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

	// 예약 정보 삭제 (임시삭제)
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

	// 임시 저장 테이블에서도 완전 삭제
	public int KandeleteReserve(int num) {
		String sql = "DELETE reserve_del WHERE d_num = ?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteSeserve 에러: " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	// 예약 정보 수정
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
}
