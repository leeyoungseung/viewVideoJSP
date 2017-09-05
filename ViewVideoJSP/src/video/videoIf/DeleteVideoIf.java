package video.videoIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.VideoDTO;
import video.module.VideoDAO;

public class DeleteVideoIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		VideoDAO dao = new VideoDAO();
		VideoDTO dto = new VideoDTO();
		String nextPage=null;
		try {
			dto.setVidNo(Integer.parseInt(request.getParameter("vidNo")));
			dto.setMemNo(Integer.parseInt(request.getParameter("memNo")));
			String msg=dao.delete(dto);
			nextPage= "list.video?memNo="+dto.getMemNo();
			request.setAttribute("msg", msg);
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="index.jsp";
		}
		return nextPage;
	}

}
