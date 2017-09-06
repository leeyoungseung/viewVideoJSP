package video.controller;

public class ReplyFactory {
	private ReplyFactory() {}
	
	private static ReplyFactory instance = new ReplyFactory();
	
	public static ReplyFactory getInstance() {
		return instance;
	};
	
	public VideoIf createCommand(String cmd) {
		
		return null;
	}
	
}
