package video.videoIf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.VideoDTO;
import video.module.VideoDAO;

public class ListVideoIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		VideoDAO dao = new VideoDAO();
		VideoDTO dto = new VideoDTO();
		String nextPage=null;
		try {
			List<VideoDTO>allList = dao.listAll();
			request.setAttribute("allList", allList);
			nextPage="/video/listAll.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="myPage.member?memNo="+dto.getMemNo();;
		}
		return nextPage;
	}

}
