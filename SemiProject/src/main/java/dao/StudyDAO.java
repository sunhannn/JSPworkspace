package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	public MemberVO selectMember(String id){
		String sql="SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		MemberVO member = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				member=new MemberVO();
				member.setM_ID(rs.getString("M_ID"));
				member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
				member.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
				member.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
			}
		}catch(Exception ex){
			System.out.println("getDeatilMember 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return mb;
	}
	
	
	
}
