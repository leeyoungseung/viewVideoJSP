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
			int memNo = Integer.parseInt(request.getParameter("memNo"));
			List<VideoDTO>myVList = dao.list(memNo);
			request.setAttribute("vList", myVList);
			nextPage="videoList.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="index.jsp";
		}
		return nextPage;
	}

}
