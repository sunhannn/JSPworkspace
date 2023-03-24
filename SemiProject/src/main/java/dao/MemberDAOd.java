package dao;

import static db.JdbcUtil.*;





import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.Member;

public class MemberDAO {
	public static MemberDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	//DS DBUTIL에 없음
	
	
	private MemberDAO() {
	    
	}
	//아이디 중복검사 아약스
	public boolean idCheck(Member member) {
        if(member.getM_ID() == null || member.getM_ID().length() == 0) {
        	System.out.println("아이디가 없습니다.");
        }
        boolean idchk = false;
        String SQL = "select count(*) as result from MEMBER where M_ID = ? ";

        try {
        	con = getConnection();
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, member.getM_ID());

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {
	            int result = rs.getInt(1);
	            if(result > 0) idchk = true;
            }
            return idchk;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idchk;
    }
	
	
	public static MemberDAO getInstance(){
		if(instance == null){
			instance = new MemberDAO();
		}
		return instance;
	}
	public void setConnection(Connection con){
		this.con = con;
	}
	//로그인
	public String selectLoginId(Member member){
		String loginId = null;
		String sql="SELECT M_ID FROM MEMBER WHERE M_ID=? AND M_PW=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				loginId = rs.getString("M_ID");
				System.out.println("loginId: "+loginId);
			}
		}catch(Exception ex){
			System.out.println(" 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return loginId;
	}
	//회원가입
	public int insertMember(Member member){
		String sql="INSERT INTO MEMBER (M_ID,M_PW,M_NAME,M_PH,M_ADDR,M_EMAIL,M_GENDER) VALUES (?,?,?,?,?,?,?)";
		int insertCount=0;
		
		try{

			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID());
			pstmt.setString(2, member.getM_PW());
			pstmt.setString(3, member.getM_NAME());
			pstmt.setString(4, member.getM_PH());
			pstmt.setString(5, member.getM_ADDR());
			pstmt.setString(6, member.getM_EMAIL());
			pstmt.setString(7, member.getM_GENDER());
			
			insertCount=pstmt.executeUpdate();
			System.out.println("insertCount: "+insertCount);
			
			if(insertCount >0) {
				commit(con);}
			else {
				rollback(con);}
			
		}catch(SQLException ex){
			
		}finally{
			close(pstmt);
		}
		
		return insertCount;
	}
	//회원탈퇴
	public int deleteMember(String deleteId){
		
		String sql="DELETE FROM MEMBER WHERE M_ID=?";
		int deleteCount = 0;
		

		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteMember 에러: " + ex);	
		}finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	//내정보수정
	public int updateMember(String updateId, Member member) {
		String sql = "update member set M_ID=?,M_PW=?,M_NAME=?,M_PH=?,M_ADDR=?,M_EMAIL=?,M_GENDER=? WHERE M_ID=?";
		int updateCount = 0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_ID()); //원래있던 id
			pstmt.setString(2, member.getM_PW());
			pstmt.setString(3, member.getM_NAME());
			pstmt.setString(4, member.getM_PH());
			pstmt.setString(5, member.getM_ADDR());
			pstmt.setString(6, member.getM_EMAIL());
			pstmt.setString(7, member.getM_GENDER());
			pstmt.setString(8, updateId);
			updateCount = pstmt.executeUpdate();
			
		}
		catch(Exception ex) {
			System.out.println("updateMember 에러: " + ex);	
			
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
	//내정보확인 ? 이게뭐지...
	public Member selectMember(String id){
		String sql="SELECT * FROM MEMBER WHERE M_ID=?";
		Member member = null;
		try{
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				member=new Member();
				member.setM_ID(rs.getString("M_ID"));
				
			}
		}catch(Exception ex){
			System.out.println("getMemberinfo 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return member;
	}
	//내정보확인
	public Member checkinfo(String id) {
		//sql 쿼리문 필요
		//데이터를 담는 로직 필요
		String sql ="select * from member where M_ID = ?"; //쿼리문
		Member member =null; //null하지않으면 null이 될 수가 없음
		 
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				member = new Member();
				member.setM_ID(rs.getString("M_ID"));
				member.setM_PW(rs.getString("M_PW"));
				member.setM_NAME(rs.getString("M_NAME"));
				member.setM_PH(rs.getString("M_PH"));
				member.setM_ADDR(rs.getString("M_ADDR"));
				member.setM_EMAIL(rs.getString("M_EMAIL"));
				member.setM_GENDER(rs.getString("M_GENDER"));
				
				
				
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return member;
}
	
	}
	

	