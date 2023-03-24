package dao;

import static db.jdbcUtil.*;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.ReserveBean;

public class ReserveDAO {

	DataSource ds;
	Connection con;
	private static ReserveDAO reserveDAO;

	private ReserveDAO() {
	}

	public static ReserveDAO getInstance(){
		if(reserveDAO == null){
			reserveDAO = new ReserveDAO();
		}
		return reserveDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//예약의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			
			pstmt=con.prepareStatement("select count(*) from reserve");
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

	//예약목록 보기 	
	public ArrayList<ReserveBean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_list_sql="select * from (select rownum rnum, A.* from (select * from reserve r_NUM order by r_num desc) A ) where rnum between ? and ?";
//		String reserve_list_sql="select * from reserve where r_num between ? and ?";
		ArrayList<ReserveBean> articleList = new ArrayList<ReserveBean>();
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
		try{
			pstmt = con.prepareStatement(reserve_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery(); 
			while(rs.next()){
				ReserveBean reserve = new ReserveBean();
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_TIME(rs.getString("R_TIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));

				articleList.add(reserve);
			}

		}catch(Exception ex){
			System.out.println("getReserveList 에러 : " + ex);
		}finally{
			close(rs); 
			close(pstmt);
		}

		return articleList;

	}
	
	
	
	// 예약 리스트 갯수 검색
	public int selectSearchListCount(String list_search, String list_search_value) {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_search_sql = null;
		try{
			if(list_search.equals("id")) {
				reserve_search_sql = "select count(*) from reserve where r_id like ?";
			}else if(list_search.equals("num")) {
				reserve_search_sql = "select count(*) from reserve where r_num=?";
			}else if(list_search.equals("name")) {
				reserve_search_sql = "select count(*) from reserve where r_name like ?";
			}else {
				reserve_search_sql = "select count(*) from reserve where r_ph like ?";
			}
			
			System.out.println("getConnection");
			pstmt=con.prepareStatement(reserve_search_sql);
			
			//자료형 맞춰서 검색되도록 조건문 걸기
			if(list_search.equals("num")) {
				pstmt.setString(1, list_search_value);
			}else {
			pstmt.setString(1, "%"+list_search_value+"%");
			}
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
	
	
	
	
	
	//예약목록 검색
	public ArrayList<ReserveBean> selectSearchArticleList(String list_search, String list_search_value,int page, int limit){
		
		ArrayList<ReserveBean> articleList = new ArrayList<ReserveBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String reserve_search_sql;
		try{
			if(list_search.equals("id")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_id like ? order by r_num desc) A ) where rnum between ? and ?";
			}else if(list_search.equals("num")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_num in ? order by r_num desc) A ) where rnum between ? and ?";
			}else if(list_search.equals("name")) {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_name like ? order by r_num desc) A ) where rnum between ? and ?";
			}else {
				reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from reserve where r_ph like ? order by r_num desc) A ) where rnum between ? and ?";
			}
			
//			ArrayList<ReserveBean> articleList = new ArrayList<ReserveBean>();
			int startrow=(page-1)*10+1;
			int endrow=(page-1)*10+10;
			
			pstmt = con.prepareStatement(reserve_search_sql);
			
			//자료형 맞춰서 검색되도록 조건문 걸기
			if(list_search.equals("num")) {
				pstmt.setString(1, list_search_value);
			}else {
			pstmt.setString(1, "%"+list_search_value+"%");
			}
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery(); 
			while(rs.next()){
				ReserveBean reserve = new ReserveBean();
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_TIME(rs.getString("R_TIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));

				articleList.add(reserve);
			}

		}catch(Exception ex){
			System.out.println("selectSearchArticleList 에러 : " + ex);
		}finally{
			close(rs); 
			close(pstmt);
		}

		return articleList;

	}
	
	
	// 선택한 예약번호 수정창에 넣을 정보 가져오기
	public ReserveBean getRnumArticle(int r_num){
		ReserveBean reserve = new ReserveBean();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="select * from reserve where r_num=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			rs = pstmt.executeQuery();
			
			//가져온 값 reserveBean에 셋팅 
			while(rs.next()){
				reserve.setR_ID(rs.getString("R_ID"));
				reserve.setR_NUM(rs.getInt("R_NUM"));
				reserve.setR_NAME(rs.getString("R_NAME"));
				reserve.setR_TIME(rs.getString("R_TIME"));
				reserve.setR_PRI(rs.getInt("R_PRI"));
				reserve.setR_PH(rs.getString("R_PH"));
				reserve.setR_ROOM(rs.getString("R_ROOM"));
			}
			
		}catch(Exception ex){
			System.out.println("ReserveModifyselect 에러 : " + ex);
		}finally{
			close(pstmt);
		}

		return reserve;
	}
	
	
	//예약 수정.
	public int updateArticle(ReserveBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update reserve set r_name=?,r_time=?, r_pri=?, r_ph=?, r_room=? where r_num=?";
		
		
		System.out.println("DAO: "+article.getR_NUM());
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getR_NAME());
			pstmt.setString(2, article.getR_TIME());
			pstmt.setInt(3, article.getR_PRI());
			pstmt.setString(4, article.getR_PH());
			pstmt.setString(5, article.getR_ROOM());
			pstmt.setInt(6, article.getR_NUM());
			
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("ReserveModify 에러 : " + ex);
		}finally{
			
			close(pstmt);
		}

		return updateCount;

	}
	
	
	
	// 예약 삭제
	public int deleteArticle(int r_num){
		String reserve_delete_sql = "delete from reserve where R_NUM=?";

		PreparedStatement pstmt = null;
		int deleteCount=0;

		try{
			pstmt = con.prepareStatement(reserve_delete_sql);
			pstmt.setInt(1, r_num);
			deleteCount =pstmt.executeUpdate();	
		
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}

}
