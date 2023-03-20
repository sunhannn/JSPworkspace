package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	public int insertMember(ReserveVO reserve, MemberVO member) {
		String sql = "INSERT INTO RESERVE VALUES (SEQ_RENUM.nextval,?,?,?,?,?,?,?,?)";
		int insertCount = 0;
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			System.out.println(member.getM_ID());
			pstmt.setString(2, member.getM_NAME());
			System.out.println(member.getM_NAME());
			pstmt.setString(3, reserve.getR_DATE());
			System.out.println(reserve.getR_DATE());
			pstmt.setString(4, reserve.getR_STIME());
			System.out.println(reserve.getR_STIME());
			pstmt.setString(5, reserve.getR_ETIME());
			System.out.println(reserve.getR_ETIME());
			pstmt.setInt(6, reserve.getR_PRI());
			System.out.println(reserve.getR_PRI());
			pstmt.setString(7, member.getM_PH());
			System.out.println(member.getM_PH());
			pstmt.setString(8, reserve.getR_ROOM());
			System.out.println(reserve.getR_ROOM());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("reserve 에러: " + ex);
		} finally {
			close(pstmt);
			
		}

		return insertCount;
	}
	
	public MemberVO selectMember(String id){
		String sql="SELECT * FROM MEMBER WHERE M_ID=?";
		MemberVO member = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				member=new MemberVO();
				member.setM_ID(rs.getString("M_ID"));
				member.setM_PW(rs.getString("M_PW"));
				member.setM_NAME(rs.getString("M_NAME"));
				member.setM_PH(rs.getString("M_PH"));
				member.setM_ADDR(rs.getString("M_ADDR"));
				member.setM_EMAIL(rs.getString("M_EMAIL"));
			}
		}catch(Exception ex){
			System.out.println("SelectMember 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		
		}
		
		return member;
	}
	
	public ArrayList<ReserveVO> selectMemberList(){
		String sql="SELECT * FROM reserve";
		ArrayList<ReserveVO> reserveList=new ArrayList<ReserveVO>();
		ReserveVO reserve = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
					reserve =new ReserveVO();
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
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println("getDeatilReserve 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return reserveList;
	}
	
	
	public ReserveVO selectReserve(String id){
		String sql="SELECT * FROM MEMBER WHERE M_ID=?";
		ReserveVO reserve = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				reserve=new ReserveVO();
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
		}catch(Exception ex){
			System.out.println("SelectMember 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		
		}
		
		return reserve;
	}
	
}
