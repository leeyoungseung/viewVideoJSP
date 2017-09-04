package video.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.factory.MemberIf;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doService(request, response);
	}
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		//要請分岐
		System.err.println(11);
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String cmd = uri.substring(path.length());
		System.out.println("why? : "+cmd);
		String nextPage=null;  
		MemberFactory factory = MemberFactory.getInstance();
		MemberIf member = factory.createCommand(cmd);
		nextPage=(String)member.processCommand(request, response);
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
	}

}
