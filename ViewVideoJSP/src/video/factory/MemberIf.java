package video.factory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberIf {
	 public Object processCommand
	 (HttpServletRequest request, HttpServletResponse response);
}
