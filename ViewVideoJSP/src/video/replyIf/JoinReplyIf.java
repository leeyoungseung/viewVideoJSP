package video.replyIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.ReplyDTO;
import video.module.ReplyDAO;

public class JoinReplyIf implements VideoIf {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ReplyDAO dao = new ReplyDAO();
		ReplyDTO dto = new ReplyDTO();
		dto.setMemNo(Integer.parseInt(request.getParameter("memNo")));
		dto.setVidNo(Integer.parseInt(request.getParameter("vidNo")));
		dto.setWriter(request.getParameter("writer"));
		dto.setContent(request.getParameter("content"));
		try {
			if(dto.getWriter().equals("")) response.getWriter().write("0");
			else response.getWriter().write(dao.submit(dto)+"");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
