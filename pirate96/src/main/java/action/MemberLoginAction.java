package action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberLoginService;
import vo.ActionForward;
import vo.Member;

public class MemberLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		Member member=new Member(); 
	   		
	   		member.setM_ID(request.getParameter("M_ID"));
	   		member.setM_PW(request.getParameter("M_PW"));
	   	
	   	
	   		
	   		MemberLoginService memberLoginService = new MemberLoginService();
	   		boolean loginResult = memberLoginService.login(member);
	   		ActionForward forward = null;
	   		if(loginResult){//true
	   	    forward = new ActionForward();
	   		session.setAttribute("M_ID", member.getM_ID());//공간 , 값
	   		forward.setRedirect(true);
	   		forward.setPath("afterlogin.jsp"); 
	   		}
	   		else{
	   			forward = new ActionForward();
//	   			response.setContentType("text/html;charset=utf-8");
//		   		PrintWriter out=response.getWriter();
//		   		out.println("<script>");
//		   		out.println("alert('로그인 실패여요');");
//		   		out.println("location.href='loginForm.jsp';"); //location href 자바스크립트에서든 html에서든 슬래시를 넣으면 컨텍스트 없애는 것
//		   		out.println("</script>");
	   			forward.setPath("loginForm.jsp?error=1");
	   		}
	   		
	   		return forward;
	}
}