package org.justking.homepage.reply.db;

import java.sql.Date;

public class ReplyDTO {
	private Integer replyNo;
	private Integer ArticleNo;
	private String replyText;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;
	
	@Override
	public String toString() {
		return "ReplyDTO [replyNo=" + replyNo + ", ArticleNo=" + ArticleNo + ", replyText=" + replyText
				+ ", replyWriter=" + replyWriter + ", regDate=" + regDate + ", upadateDate=" + updateDate + "]";
	}
	public Integer getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}
	public Integer getArticleNo() {
		return ArticleNo;
	}
	public void setArticleNo(Integer articleNo) {
		ArticleNo = articleNo;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpadateDate() {
		return updateDate;
	}
	public void setUpadateDate(Date upadateDate) {
		this.updateDate = upadateDate;
	}
}
