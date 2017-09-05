package video.videoIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.VideoDTO;
import video.module.VideoDAO;

public class JoinVideoIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		VideoDAO dao = new VideoDAO();
		VideoDTO dto = new VideoDTO();
		String msg = null;
		String nextPage=null;
		try {
			dto.setMemNo(Integer.parseInt(request.getParameter("memNo")));
			dto.setVidAddr(request.getParameter("vidAddr"));
			msg = dao.createOne(dto);
			nextPage= "list.video?memNo="+dto.getMemNo();
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="index.jsp";
		}
		return nextPage;
	}

}
