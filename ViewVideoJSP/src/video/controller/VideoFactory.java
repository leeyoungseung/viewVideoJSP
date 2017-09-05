package video.controller;

import video.videoIf.DeleteVideoIf;
import video.videoIf.JoinVideoIf;
import video.videoIf.ListVideoIf;
import video.videoIf.ReadVideoIf;

public class VideoFactory {
	private VideoFactory(){}
	
	private static VideoFactory instance = new VideoFactory();
	
	public static VideoFactory getInstance(){
		return instance;
	}
	
	public VideoIf createCommand(String cmd){
		System.out.println("createCommand cmd : "+cmd);
		if(cmd.equals("/list.video")) return new ListVideoIf();
		else if(cmd.equals("/read.video")) return new ReadVideoIf();
		else if(cmd.equals("/join.video")) return new JoinVideoIf();
		else if(cmd.equals("/delete.member")) return new DeleteVideoIf();
		return null;
	}
}
