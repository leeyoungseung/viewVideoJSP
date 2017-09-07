package video.controller;


import video.replyIf.DeleteReplyIf;
import video.replyIf.JoinReplyIf;
import video.replyIf.ListReplyIf;
import video.replyIf.UpdateReplyIf;

public class ReplyFactory {
	private ReplyFactory() {}
	
	private static ReplyFactory instance = new ReplyFactory();
	
	public static ReplyFactory getInstance() {
		return instance;
	};
	
	public VideoIf createCommand(String cmd) {
		if(cmd.equals("/list.reply")) return new ListReplyIf();
		else if(cmd.equals("/join.reply")) return new JoinReplyIf();
		else if(cmd.equals("/update.reply")) return new UpdateReplyIf();
		else if(cmd.equals("/delete.reply")) return new DeleteReplyIf();
		return null;
	}
	
}
