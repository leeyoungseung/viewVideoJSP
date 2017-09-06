package video.memberIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.controller.VideoIf;
import video.dto.MemberDTO;
import video.dto.VideoDTO;
import video.module.MemberDAO;
import video.module.VideoDAO;

public class MyPageMemberIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO mdto = new MemberDTO();
		VideoDAO vdao = new VideoDAO();
		String nextPage="login.jsp";
		try {
			Integer memNo = Integer.parseInt(request.getParameter("memNo"));
			request.setAttribute("vlist", vdao.list(memNo));
			nextPage="myPage.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return nextPage;
	}

}
