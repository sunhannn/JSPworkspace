package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.BoardBean;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
	}

	public static BoardDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	//글의 개수 구하기.
	public int selectListCount() {

		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{


			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from board1");
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

	//글 목록 보기.	
	public ArrayList<BoardBean> selectArticleList(int page,int limit){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select * from (select rownum rnum, A.* from (select * from board1 order by BOARD_NUM desc ) A ) where rnum between ? and ?";
//		String board_list_sql="select * from (select rownum rnum, A.* from board A order by BOARD_RE_REF desc,BOARD_RE_SEQ asc ) where rnum between ? and ? ";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		int startrow=(page-1)*10+1; //읽기 시작할 row 번호..	
		int endrow=(page-1)*10+10;

		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while(rs.next()){
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				articleList.add(board);
			}

		}catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	//글 내용 보기.
	public BoardBean selectArticle(int board_num){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;

		try{
			pstmt = con.prepareStatement( "select * from board1 where BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rs= pstmt.executeQuery();

			if(rs.next()){
				boardBean = new BoardBean();
				boardBean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardBean.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardBean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardBean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardBean.setBOARD_FILE(rs.getString("BOARD_FILE"));
				boardBean.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardBean.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
		}catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	//글 등록.
	public int insertArticle(BoardBean article){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(board_num) FROM BOARD1");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;

			sql="insert into board1 (BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE,BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,SYSDATE)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_SUBJECT());
			pstmt.setString(4, article.getBOARD_CONTENT());
			pstmt.setString(5, article.getBOARD_FILE());
			pstmt.setInt(6, 0);

			insertCount=pstmt.executeUpdate();

		}catch(Exception ex){
			System.out.println("boardInsert 에러 : "+ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}


	//글 수정.
	public int updateArticle(BoardBean article){

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql="update board1 set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";

		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());
			updateCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("boardModify 에러 : " + ex);
		}finally{
			close(pstmt);
		}

		return updateCount;

	}

	//글 삭제.
	public int deleteArticle(int board_num){

		String board_file = "select BOARD_FILE FROM BOARD1 where BOARD_num=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_delete_sql="delete FROM BOARD1 where BOARD_num=?";
		int deleteCount=0;
		String filenm = "";
		
		try{
			pstmt=con.prepareStatement(board_file);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			rs.next();
			filenm = rs.getString("BOARD_FILE");
			
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
			/*
			 * if( file.exists() ){ if(file.delete()){ System.out.println("파일삭제 성공"); }else{
			 * System.out.println("파일삭제 실패"); } }else{ System.out.println("파일이 존재하지 않습니다.");
			 * }
			 */
			File file = new File("C:\\jspwork\\servletproject\\src\\main\\webapp\\boardUpload/" + filenm);	
			if(file.exists()) {
				file.delete();
			}
		
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}

		return deleteCount;
	     
	}
	
//	//글 삭제.
//		public int deleteArticle(int board_num){
//			
//			PreparedStatement pstmt = null;
//			String board_delete_sql="delete from board where BOARD_num=?";
//			File file = new File("c:jspwork/servletproject/boardUpload/");
//			int deleteCount=0;
//
//			try{
//				pstmt=con.prepareStatement(board_delete_sql);
//				pstmt.setInt(1, board_num);
//				deleteCount=pstmt.executeUpdate();
//				if( file.exists() ){ //파일존재여부확인
//		    		
//		    		if(file.isDirectory()){ //파일이 디렉토리인지 확인
//		    			
//		    			File[] files = file.listFiles();
//		    			
//		    			for( int i=0; i<files.length; i++){
//		    				if( files[i].delete() ){
//		    					System.out.println(files[i].getName()+" 삭제성공");
//		    				}else{
//		    					System.out.println(files[i].getName()+" 삭제실패");
//		    				}
//		    			}
//		    			
//		    		}
//		    		if(file.delete()){
//		    			System.out.println("파일삭제 성공");
//		    		}else{
//		    			System.out.println("파일삭제 실패");
//		    		}
//		    		
//		    	}else{
//		    		System.out.println("파일이 존재하지 않습니다.");
//		    	}
//			}catch(Exception ex){
//				System.out.println("boardDelete 에러 : "+ex);
//			}	finally{
//				close(pstmt);
//			}
//
//			return deleteCount;
//
//		}

	//조회수 업데이트.
	public int updateReadCount(int board_num){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update board1 set BOARD_READCOUNT = "+
				"BOARD_READCOUNT+1 where BOARD_NUM = "+board_num;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate 에러 : "+ex);
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

	//글쓴이인지 확인.
	
	  public boolean isArticleBoardWriter(int board_num,String name){
	  
	  PreparedStatement pstmt = null; ResultSet rs = null; String
	  board_sql="select * FROM BOARD1 where BOARD_NUM=?"; boolean isWriter = false;
	  
	  try{ pstmt=con.prepareStatement(board_sql); pstmt.setInt(1, board_num);
	  rs=pstmt.executeQuery(); rs.next();
	  
	  if(name.equals(rs.getString("BOARD_NAME"))){ isWriter = true; }
	  }catch(SQLException ex){ System.out.println("isBoardWriter 에러 : "+ex); }
	  finally{ close(pstmt); }
	  
	  return isWriter;
	  
	  }
	 
	  //검색
	  public int selectSearchListCount(String list_search, String list_search_value) {

			int listCount= 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String reserve_search_sql = null;
			try{
				if(list_search.equals("subject")) {
					reserve_search_sql = "select count(*) from board1 where board_subject like ?";
				}else if(list_search.equals("num")) {
					reserve_search_sql = "select count(*) from board1 where board_num=?";
				}else {
					reserve_search_sql = "select count(*) from board1 where board_name like ?";
				}
				
				System.out.println("BoardDAO까진 연결 됐음");
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
		public ArrayList<BoardBean> selectSearchArticleList(String list_search, String list_search_value,int page, int limit){
			
			ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String reserve_search_sql;
			try{
				if(list_search.equals("subject")) {
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from BOARD1 where BOARD_SUBJECT like ? order by board_num desc) A ) where rnum between ? and ?";
				}else if(list_search.equals("num")) {
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from BOARD1 where BOARD_num in ? order by board_num desc) A ) where rnum between ? and ?";
				}else {
					reserve_search_sql = "select * from (select rownum rnum, A.* from (select * from BOARD1 where BOARD_name like ? order by board_num desc) A ) where rnum between ? and ?";
				}
				
//				ArrayList<ReserveBean> articleList = new ArrayList<ReserveBean>();
				int startrow=(page-1)*10+1;
				int endrow=(page-1)*10+10;
				System.out.println("BoardDAO까진 연결 됐음22");
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
					BoardBean boradbean = new BoardBean();
					boradbean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
					boradbean.setBOARD_NAME(rs.getString("BOARD_NAME"));
					boradbean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));;

					articleList.add(boradbean);
				
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
