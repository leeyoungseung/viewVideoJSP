package video.memberIf;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.controller.VideoIf;
import video.dto.MemberDTO;
import video.module.MemberDAO;

public class LoginMemberIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		String nextPage = null;
		try {
			dto.setMemId(request.getParameter("memId"));
			dto.setMemPw(request.getParameter("memPw"));
			HashMap hm = dao.confirmIDPW(dto);
			switch ((int)hm.get("resNo")) {
			case 1:
				HttpSession session = request.getSession();
				session.setAttribute("user", hm.get("user"));
				request.setAttribute("msg", hm.get("result"));
				dto =(MemberDTO)hm.get("user");
				System.out.println(1 + dto.toString());
				nextPage = "myPage.jsp";
				break;
			case 2:
				request.setAttribute("msg", hm.get("result"));
				nextPage = "index.jsp";
				System.out.println(2 + dto.toString());
				break;
			case 3:
				request.setAttribute("msg", hm.get("result"));
				nextPage = "index.jsp";
				System.out.println(3 + dto.toString());
				break;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return nextPage;
	}

}
