package video.dto;

public class MemberDTO {
	private Integer memNo;
	private String memId;
	private String memPw;
	private String memName;
	public Integer getMemNo() {
		return memNo;
	}
	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	@Override
	public String toString() {
		return "MemberDTO [memNo=" + memNo + ", memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + "]";
	}
	
}
