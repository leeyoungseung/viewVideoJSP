package video.videoIf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import video.controller.VideoIf;
import video.dto.VideoDTO;
import video.module.VideoDAO;

public class JoinVideoIf implements VideoIf {

	protected String makeAddr(String oldAddr) {
		String result=null;
		String addr1= oldAddr.substring(0, 24);
		System.out.println("addr1 : "+addr1);
		String addr2=oldAddr.substring(24);
		System.out.println("addr2 : "+addr2);
		if(addr2.length()==19) addr2 = addr2.substring(8);
		String addrPlus="embed/";
		result = addr1+addrPlus+addr2;
		return result;
	}
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		VideoDAO dao = new VideoDAO();
		VideoDTO dto = new VideoDTO();
		String msg = null;
		String nextPage=null;
		try {
			dto.setMemNo(Integer.parseInt(request.getParameter("memNo")));
			dto.setVidAddr(makeAddr(request.getParameter("vidAddr")));
			dto.setVidSub(request.getParameter("vidSub"));
			dto.setVidContent(request.getParameter("vidContent"));
			msg = dao.createOne(dto);
			request.setAttribute("msg", msg);
			nextPage="myPage.member?memNo="+dto.getMemNo();
		}catch (Exception e) {
			e.printStackTrace();
			nextPage="myPage.member?memNo="+dto.getMemNo();
		}
		return nextPage;
	}

}
