package video.dto;

import java.util.Date;

public class VideoDTO {
	private Integer vidNo;
	private Integer memNo;
	private String vidAddr;
	private Date vidDate;
	public Integer getVidNo() {
		return vidNo;
	}
	public void setVidNo(Integer vidNo) {
		this.vidNo = vidNo;
	}
	public Integer getMemNo() {
		return memNo;
	}
	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}
	public String getVidAddr() {
		return vidAddr;
	}
	public void setVidAddr(String vidAddr) {
		this.vidAddr = vidAddr;
	}
	public Date getVidDate() {
		return vidDate;
	}
	public void setVidDate(Date vidDate) {
		this.vidDate = vidDate;
	}
	@Override
	public String toString() {
		return "VideoDTO [vidNo=" + vidNo + ", memNo=" + memNo + ", vidAddr=" + vidAddr + ", vidDate=" + vidDate + "]";
	}
	
}
