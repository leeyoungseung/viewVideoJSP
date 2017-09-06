package video.memberIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.controller.VideoIf;
import video.dto.MemberDTO;

public class LogoutMemberIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String nextPage = null;
		HttpSession session = request.getSession();
		try {
			/*MemberDTO dto = (MemberDTO) session.getAttribute("user");
			System.out.println(dto.toString());*/
			session.removeAttribute("user");
			session.invalidate();
			nextPage = "login.jsp";
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("logout error");
		}
		return nextPage;
	}

}
