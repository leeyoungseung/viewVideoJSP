package video.dto;

import java.util.Date;

public class ReplyDTO {

	private Integer reNo;
	private Integer memNo;
	private Integer vidNo;
	private String writer;
	private String content;
	private Date reDate;
	
	@Override
	public String toString() {
		return "ReplyDTO [reNo=" + reNo + ", memNo=" + memNo + ", vidNo=" + vidNo + ", writer=" + writer + ", content="
				+ content + ", reDate=" + reDate + "]";
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	public Integer getReNo() {
		return reNo;
	}
	public void setReNo(Integer reNo) {
		this.reNo = reNo;
	}
	public Integer getMemNo() {
		return memNo;
	}
	public void setMemNo(Integer memNo) {
		this.memNo = memNo;
	}
	public Integer getVidNo() {
		return vidNo;
	}
	public void setVidNo(Integer vidNo) {
		this.vidNo = vidNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
