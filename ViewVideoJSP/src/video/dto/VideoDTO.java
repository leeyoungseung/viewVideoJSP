package video.dto;

import java.util.Date;

public class VideoDTO {
	private Integer vidNo;
	private Integer memNo;
	private String vidAddr;
	private Date vidDate;
	private Integer vidLike;
	private String vidSub;
	private String vidContent;
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
	public Integer getVidLike() {
		return vidLike;
	}
	public void setVidLike(Integer vidLike) {
		this.vidLike = vidLike;
	}
	public String getVidSub() {
		return vidSub;
	}
	public void setVidSub(String vidSub) {
		this.vidSub = vidSub;
	}
	public String getVidContent() {
		return vidContent;
	}
	public void setVidContent(String vidContent) {
		this.vidContent = vidContent;
	}
	@Override
	public String toString() {
		return "VideoDTO [vidNo=" + vidNo + ", memNo=" + memNo + ", vidAddr=" + vidAddr + ", vidDate=" + vidDate
				+ ", vidLike=" + vidLike + ", vidSub=" + vidSub + ", vidContent=" + vidContent + "]";
	}
}
