package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import svc.MemberCheckAjaxService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberCheckAjaxAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("idJoonbok");
		System.out.println(id);
		MemberVO member = new MemberVO();
		member.setM_ID(id);
		boolean result = false;
		MemberCheckAjaxService memberCheckAjaxService = new MemberCheckAjaxService();

		result = memberCheckAjaxService.loginCheck(member);
		String str;

		if (result)
			str = "사용하실 수 없는 아이디입니다.";
		else
			str = "사용 가능한 아이디입니다.";

		JSONObject jObject = new JSONObject();
		jObject.put("str", str);
		jObject.put("id", id);

		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObject);

		return null;
	}

}
