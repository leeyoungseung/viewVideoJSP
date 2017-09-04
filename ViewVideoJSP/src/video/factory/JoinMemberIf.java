package video.factory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.dto.MemberDTO;
import video.module.MemberDAO;

public class JoinMemberIf implements MemberIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		try {
			dto.setMemId(request.getParameter("memId"));
			dto.setMemPw(request.getParameter("memPw"));
			dto.setMemName(request.getParameter("memName"));
			String msg = dao.createOne(dto);
			request.setAttribute("msg", msg);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "index.jsp";
	}

}
