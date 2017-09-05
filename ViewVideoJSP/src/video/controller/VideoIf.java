package video.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface VideoIf {
	 public Object processCommand
	 (HttpServletRequest request, HttpServletResponse response);
}
