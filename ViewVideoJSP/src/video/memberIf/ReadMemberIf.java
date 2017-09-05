package video.memberIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.MemberDTO;
import video.module.MemberDAO;

public class ReadMemberIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		String nextPage = null;
		try {
			dto.setMemNo(Integer.parseInt(request.getParameter("memNo")));
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return nextPage;
	}

}
