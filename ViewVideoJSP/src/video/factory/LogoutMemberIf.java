package video.factory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.dto.MemberDTO;

public class LogoutMemberIf implements MemberIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String nextPage = null;
		HttpSession session = request.getSession();
		try {
			MemberDTO dto = (MemberDTO) session.getAttribute("user");
			System.out.println(dto.toString());
			session.invalidate();
			MemberDTO dto2 = (MemberDTO) session.getAttribute("user");
			if(dto2==null) {
				System.out.println("LogoutMemberIf : "+1);
				nextPage = "index.jsp";
			}else {
				System.out.println("LogoutMemberIf : "+2);
				session.removeAttribute("user");
				nextPage = "index.jsp";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return nextPage;
	}

}
