package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberListAction;
import action.MemberSearchAction;
import action.ReserveDeleteAction;
import action.ReserveListAction;
import action.ReserveModifyAction;
import action.ReserveModifyFormAction;
import action.ReserveSearchAction;
import vo.ActionForward;

@WebServlet("*.go")
public class AdminController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		// 카데고리 값(아이디, 이름 등) 과 검색값(input에 쓴 내용) 받아오기
		String list_search = request.getParameter("search"); //카테고리
		String list_search_value = request.getParameter("search_value");//검색값


		
		
		// 예약 관리창-------------------------------------
			if(command.equals("/reserveList.go")){
			action = new ReserveListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
			//--------------------------------------------
			
			
			
		// 예약 검색-----------------------------------
		else if(command.equals("/reserveSearch.go")){
			action = new ReserveSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//--------------------------------------------
		
			
		
		//예약 수정 폼 가는 거--------------------------------------
		else if(command.equals("/reserveModify.go")){
			action = new ReserveModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//--------------------------------------------
		
			
		//예약 수정 완료하기(DB데이터 바꾸기)--------------------------------------
		else if(command.equals("/reserveModifyPro.go")){
			action = new ReserveModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//--------------------------------------------
			
	

		//예약 삭제--------------------------------------
		else if(command.equals("/reserveDelete.go")){
			action = new ReserveDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//-------
			
//		===================================================================	
			
			
			
			
		// 회원관리창-----------------------------------
		else if(command.equals("/memberList.go")){
			action = new MemberListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//--------------------------------------------
	
			
		// 회원 검색-----------------------------------
		else if(command.equals("/memberSearch.go")){
			action = new MemberSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//--------------------------------------------
		
			
			
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	
	// doGet , doPost 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}