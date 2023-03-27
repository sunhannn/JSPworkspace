package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ReserveVO;
import vo.ActionForward;
import vo.MemberVO;
import svc.JoongbokService;
import svc.RerserveService;
import svc.ReserveMemberGoService;

public class ReserveAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		ActionForward forward = null;
		ReserveVO reserve = new ReserveVO();
		boolean reserveResult = false;
		ReserveMemberGoService memberGo = new ReserveMemberGoService();
		MemberVO member = new MemberVO();
		member = memberGo.reserveMemCheck(id);
		reserve.setR_ID(id);
		reserve.setR_NAME(member.getM_NAME());
		reserve.setR_DATE(request.getParameter("R_DATE"));
		reserve.setR_PH(member.getM_PH());
		reserve.setR_ROOM(request.getParameter("R_ROOM"));
		reserve.setR_STIME(request.getParameter("R_STIME"));
		reserve.setR_ETIME(request.getParameter("R_ETIME"));
		
		System.out.println(reserve.getR_ID());
		System.out.println(reserve.getR_NAME());
	
		
		
		
		
		
		
		// 방번호에 따라 가격 계산식
		int roomNum = Integer.parseInt(reserve.getR_ROOM());
		int time = Integer.parseInt(reserve.getR_ETIME()) - Integer.parseInt(reserve.getR_STIME());
		if (roomNum < 3) {
			reserve.setR_PRI(10000 * time);
		} else if (roomNum < 5) {
			reserve.setR_PRI(20000 * time);
		} else {
			reserve.setR_PRI(30000 * time);
		}

		// 시작시간이 종료시간과 같거나 클때 예약이 안되게 하는 식
		int sTime = Integer.parseInt(reserve.getR_STIME());
		int eTime = Integer.parseInt(reserve.getR_ETIME());

		if (sTime > eTime) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('시작 시간이 종료 시간보다 작게 설정해주세요!')");
			out.println("history.back()");
			out.println("</script>");
			return forward;

		} else if (sTime == eTime) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('시작 시간이 종료 시간보다 작게 설정해주세요!')");
			out.println("history.back()");
			out.println("</script>");
			return forward;
		}

		// 방번호와 그 시간에 예약이 있는 경우 찾아내는 식
		JoongbokService joongbok = new JoongbokService();
		ArrayList<ReserveVO> joongbokList = joongbok.reserveCheck(reserve.getR_DATE());

		boolean check1 = false;
		boolean check2 = false;
		boolean check3 = false;
		for (ReserveVO s : joongbokList) {
			if (Integer.parseInt(s.getR_STIME()) == Integer.parseInt(reserve.getR_STIME())) {
				check1 = true;
				break;
			}

		}
		for (ReserveVO s : joongbokList) {
			if (Integer.parseInt(s.getR_ETIME()) == Integer.parseInt(reserve.getR_ETIME())) {
				check2 = true;
				break;
			}

		}
		for (ReserveVO s : joongbokList) {
			if (Integer.parseInt(s.getR_ROOM()) == Integer.parseInt(reserve.getR_ROOM())) {
				check3 = true;
				break;
			}

		}

		// 3개 조건이 다 참이면 예약 안됨
		if (check1 && check2 && check3) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 예약된 객실입니다!')");
			out.println("history.back()");
			out.println("</script>");
			return forward;
		}

		// 같은 방 겹치는 시간이 있는 경우 예약이 안되게 하는 식
		JoongbokService joongbokTime = new JoongbokService();
		ArrayList<ReserveVO> joongbokTimeList = joongbokTime.reserveCheck(reserve.getR_DATE());
		boolean checkGo1 = false;
		boolean checkGo2 = false;
		for (ReserveVO s : joongbokTimeList) {
			if (sTime < Integer.parseInt(s.getR_STIME()) && Integer.parseInt(s.getR_ETIME()) > sTime
					&& roomNum == Integer.parseInt(s.getR_ROOM())) {
				checkGo1 = true;

			}
		}
		for (ReserveVO s : joongbokTimeList) {
			if (eTime < Integer.parseInt(s.getR_STIME()) && Integer.parseInt(s.getR_ETIME()) > eTime
					&& roomNum == Integer.parseInt(s.getR_ROOM())) {
				checkGo2 = true;

			}

		}

		if (checkGo1 || checkGo2) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 예약된 객실입니다!')");
			out.println("history.back()");
			out.println("</script>");
			return forward;

		}

		RerserveService reserveService = new RerserveService();

		reserveResult = reserveService.reserveResult(reserve);

		if (reserveResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약에 실패하였습니다!')");
			out.println("history.back()");
			out.println("</script>");

		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./revSuccess.jsp");

		}

		return forward;
	}

}
