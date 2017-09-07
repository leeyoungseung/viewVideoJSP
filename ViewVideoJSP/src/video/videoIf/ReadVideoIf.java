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
			System.out.println("ReadVideoIf :"+dto.toString());
			request.setAttribute("dto", dto);
			nextPage="/video/readVideo.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="myPage.member?memNo="+dto.getMemNo();
		}
		return nextPage;
	}

}
