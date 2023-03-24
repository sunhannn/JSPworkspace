package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.JoongbokService;
import svc.RerserveService;
import svc.ReserveUpdateService;
import vo.ActionForward;
import vo.ReserveVO;

public class ReserveUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		ActionForward forward = null;
		ReserveVO reserve = new ReserveVO();
		boolean updateResult = false;
		reserve.setR_NUM(num);
		reserve.setR_ID(request.getParameter("M_ID"));
		reserve.setR_NAME(request.getParameter("M_NAME"));
		reserve.setR_DATE(request.getParameter("R_DATE"));
		reserve.setR_PH(request.getParameter("M_PH"));
		reserve.setR_ROOM(request.getParameter("R_ROOM"));
		reserve.setR_STIME(request.getParameter("R_STIME"));
		reserve.setR_ETIME(request.getParameter("R_ETIME"));

		// 방번호에 따라 시간을 빼서 가격 계산
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

		ReserveUpdateService updateService = new ReserveUpdateService();

		updateResult = updateService.updateResult(reserve);

		if (updateResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정에 실패했습니다!')");
			out.println("history.back()");
			out.println("</script>");

		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./revList.go");

		}

		return forward;

	}

}
