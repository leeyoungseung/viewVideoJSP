package video.memberIf;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.controller.VideoIf;
import video.dto.MemberDTO;
import video.module.MemberDAO;

public class UpdateMemberIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		try {
			dto.setMemNo(Integer.parseInt(request.getParameter("memNo")));
			dto.setMemPw(request.getParameter("memPw"));
			dto.setMemName(request.getParameter("memName"));
			dto.setMemEmail(request.getParameter("memEmail"));
			HashMap hm = dao.update(dto);
			request.setAttribute("msg", hm.get("msg"));
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			System.out.println(hm.get("newUser"));
			session.setAttribute("user", hm.get("newUser"));
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "myPage.member?memNo="+dto.getMemNo();
	}

}
