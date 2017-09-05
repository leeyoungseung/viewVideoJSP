package video.videoIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.VideoDTO;
import video.module.VideoDAO;

public class ReadVideoIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		VideoDAO dao = new VideoDAO();
		VideoDTO dto = new VideoDTO();
		String nextPage=null;
		try {
			int vidNo = Integer.parseInt(request.getParameter("vidNo"));
			dto = dao.getOne(vidNo);
			request.setAttribute("dto", dto);
			nextPage="readVideo.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="index.jsp";
		}
		return nextPage;
	}

}
