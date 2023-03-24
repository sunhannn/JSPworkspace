package dao;

import static db.jdbcUtil.*;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.MemberBean;
import vo.ReserveBean;

public class MemberDAO {

	DataSource ds;
	Connection con;
	private static MemberDAO memberDAO;

	private MemberDAO() {
	}

	public static MemberDAO getInstance(){
		if(memberDAO == null){
			memberDAO = new MemberDAO();
		}
		return memberDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//회원의 수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			
			pstmt=con.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
			
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	//회원목록 보기 	
	public ArrayList<MemberBean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_list_sql="select * from (select rownum rnum, A.* from (select * from member) A ) where rnum between ? and ?";
//		String reserve_list_sql="select * from reserve where r_num between ? and ?";
		ArrayList<MemberBean> articleList = new ArrayList<MemberBean>();
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
		try{
			pstmt = con.prepareStatement(reserve_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery(); 
			while(rs.next()){
				MemberBean membere = new MemberBean();
				membere.setM_ID(rs.getString("M_ID"));
				membere.setM_PW(rs.getString("M_PW"));
				membere.setM_NAME(rs.getString("M_NAME"));
				membere.setM_PH(rs.getString("M_PH"));
				membere.setM_ADDR(rs.getString("M_ADDR"));
				membere.setM_EMAIL(rs.getString("M_EMAIL"));
				membere.setM_GENDER(rs.getString("M_GENDER"));

				articleList.add(membere);
			}

		}catch(Exception ex){
			System.out.println("getReserveList 에러 : " + ex);
		}finally{
			close(rs); 
			close(pstmt);
		}

		return articleList;

	}
	
	
	
	// 회원 검색 리스트 갯수 검색
		public int selectSearchListCount(String list_search, String list_search_value) {

			int listCount= 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String member_search_sql = null;
			try{

				if(list_search.equals("id")) {
					member_search_sql = "select count(*) from member where m_id like ?";
				}else if(list_search.equals("name")) {
					member_search_sql = "select count(*) from member where m_name like ?";
				}else if(list_search.equals("ph")) {
					member_search_sql = "select count(*) from member where m_ph like ?";
				}else if(list_search.equals("addr")) {
					member_search_sql = "select count(*) from member where m_addr like ?";
				}else if(list_search.equals("email")) {
					member_search_sql = "select count(*) from member where m_email like ?";
				}else{
					member_search_sql = "select count(*) from member where m_gender like ?";
				}
				
				
				System.out.println("getConnection");
				
				pstmt=con.prepareStatement(member_search_sql);
				pstmt.setString(1,"%"+list_search_value+"%");
				rs = pstmt.executeQuery();

				if(rs.next()){
					listCount=rs.getInt(1);
				}
				
			}catch(Exception ex){
				System.out.println("selectSearchListCount 에러: " + ex);			
			}finally{
				close(rs);
				close(pstmt);
			}

			return listCount;

		}
		
		
		
		
		
		//회원목록 검색
		public ArrayList<MemberBean> selectSearchArticleList(String list_search, String list_search_value,int page, int limit){
			
			ArrayList<MemberBean> articleList = new ArrayList<MemberBean>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String reserve_search_sql;
			try{
				if(list_search.equals("id")) {
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_id like ?) A ) where rnum between ? and ?";
				}else if(list_search.equals("name")) {
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_name like ?) A ) where rnum between ? and ?";
				}else if(list_search.equals("ph")){
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_ph like ?) A ) where rnum between ? and ?";
				}else if(list_search.equals("addr")){
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_addr like ?) A ) where rnum between ? and ?";
				}else if(list_search.equals("email")){
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_email like ?) A ) where rnum between ? and ?";
				}else{
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from member where m_gender like ?) A ) where rnum between ? and ?";
				}
				
//				ArrayList<ReserveBean> articleList = new ArrayList<ReserveBean>();
				int startrow=(page-1)*10+1;
				int endrow=(page-1)*10+10;
				
				pstmt = con.prepareStatement(reserve_search_sql);
				pstmt.setString(1, "%"+list_search_value+"%");
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				rs = pstmt.executeQuery(); 
				while(rs.next()){
					MemberBean member = new MemberBean();
					member.setM_ID(rs.getString("M_ID"));
					member.setM_PW(rs.getString("M_PW"));
					member.setM_NAME(rs.getString("M_NAME"));
					member.setM_PH(rs.getString("M_PH"));
					member.setM_ADDR(rs.getString("M_ADDR"));
					member.setM_EMAIL(rs.getString("M_EMAIL"));
					member.setM_GENDER(rs.getString("M_GENDER"));
					articleList.add(member);
				}

			}catch(Exception ex){
				System.out.println("selectSearchArticleList 에러 : " + ex);
			}finally{
				close(rs); 
				close(pstmt);
			}

			return articleList;

		}

}
