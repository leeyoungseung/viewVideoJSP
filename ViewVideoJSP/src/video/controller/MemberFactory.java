package video.controller;

import video.memberIf.*;


public class MemberFactory {
	private MemberFactory() {}
	
	private static MemberFactory instance =new MemberFactory();
	
	public static MemberFactory getInstance() {
		return instance;
	}
	
	public VideoIf createCommand(String cmd) {
		if(cmd.equals("/login.member")) return new LoginMemberIf();
		else if(cmd.equals("/logout.member")) return new LogoutMemberIf();
		else if(cmd.equals("/join.member")) return new JoinMemberIf();
		else if(cmd.equals("/delete.member")) return new DeleteMemberIf();
		else if(cmd.equals("/read.member")) return new ReadMemberIf();
		else if(cmd.equals("/update.member")) return new UpdateMemberIf();
		else if(cmd.equals("/myPage.member")) return new MyPageMemberIf();
		return null;
	}
}
