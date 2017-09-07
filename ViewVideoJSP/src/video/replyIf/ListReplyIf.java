package video.replyIf;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.ReplyDTO;
import video.module.ReplyDAO;

public class ListReplyIf implements VideoIf {
	private ReplyDAO dao = null;
	public ListReplyIf() {
		dao = new ReplyDAO();
	}
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		ReplyDTO dto = new ReplyDTO();
		try {
			response.getWriter().write(getList(request, response));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//오늘에 대한 DB데이터 결과를 JSON타입으로 리턴함
	public String getList(HttpServletRequest request, HttpServletResponse response){
		StringBuffer result = new StringBuffer("");
		ReplyDTO dto = new ReplyDTO();
		dto.setVidNo(Integer.parseInt(request.getParameter("vidNo")));
		result.append("{\"result\":[");
		ReplyDAO chatDAO = new ReplyDAO();
		List<ReplyDTO> chatList = chatDAO.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()), dto);
		for(int i=0; i<chatList.size(); i++){
			result.append("[{\"value\": \""+chatList.get(i).getReNo()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getWriter()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getContent()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getReDate()+"\"}]");
			if(i != chatList.size() - 1) result.append(",");
		}
		result.append("], \"last\":\""+chatList.get(chatList.size()-1).getReNo() +"\"}");
		System.out.println(result.toString());
		return result.toString();
		}
}
