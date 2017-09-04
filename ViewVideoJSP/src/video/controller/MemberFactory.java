package video.controller;

import video.factory.*;


public class MemberFactory {
	private MemberFactory() {}
	
	private static MemberFactory instance =new MemberFactory();
	
	public static MemberFactory getInstance() {
		return instance;
	}
	
	public MemberIf createCommand(String cmd) {
		if(cmd.equals("/login.member")) return new LoginMemberIf();
		else if(cmd.equals("/logout.member")) return new LogoutMemberIf();
		else if(cmd.equals("/join.member")) return new JoinMemberIf();
		else if(cmd.equals("/delete.member")) return new DeleteMemberIf();
		else if(cmd.equals("/read.member")) return new ReadMemberIf();
		return null;
	}
}
