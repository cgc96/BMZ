package org.justking.homepage.board.db;

import java.sql.Date;

public class BoardDTO {
	private Integer articleNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	private int likes;
	private int dislikes;
	private String gu;
	
	private Integer hot_articleNo;
	private String hot_title;
	private String hot_content;
	private String hot_writer;
	private Date hot_regDate;
	private int hot_viewCnt;
	private int hot_likes;
	private int hot_dislikes;
	
	
	private int comt_count;
	
	public Integer getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(Integer articleNo) {
		this.articleNo = articleNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getComt_count() {
		return comt_count;
	}
	public void setComt_count(int comt_count) {
		this.comt_count = comt_count;
	}
	
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getDislikes() {
		return dislikes;
	}
	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}
	
	
	public Integer getHot_articleNo() {
		return hot_articleNo;
	}
	public void setHot_articleNo(Integer hot_articleNo) {
		this.hot_articleNo = hot_articleNo;
	}
	public String getHot_title() {
		return hot_title;
	}
	public void setHot_title(String hot_title) {
		this.hot_title = hot_title;
	}
	public String getHot_content() {
		return hot_content;
	}
	public void setHot_content(String hot_content) {
		this.hot_content = hot_content;
	}
	public String getHot_writer() {
		return hot_writer;
	}
	public void setHot_writer(String hot_writer) {
		this.hot_writer = hot_writer;
	}
	public Date getHot_regDate() {
		return hot_regDate;
	}
	public void setHot_regDate(Date hot_regDate) {
		this.hot_regDate = hot_regDate;
	}
	public int getHot_viewCnt() {
		return hot_viewCnt;
	}
	public void setHot_viewCnt(int hot_viewCnt) {
		this.hot_viewCnt = hot_viewCnt;
	}
	public int getHot_likes() {
		return hot_likes;
	}
	public void setHot_likes(int hot_likes) {
		this.hot_likes = hot_likes;
	}
	public int getHot_dislikes() {
		return hot_dislikes;
	}
	public void setHot_dislikes(int hot_dislikes) {
		this.hot_dislikes = hot_dislikes;
	}
	
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	@Override
	public String toString() {
		return "BoardDTO [articleNo=" + articleNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", likes=" + likes + ", dislikes=" + dislikes
				+ ", gu=" + gu + ", hot_articleNo=" + hot_articleNo + ", hot_title=" + hot_title + ", hot_content="
				+ hot_content + ", hot_writer=" + hot_writer + ", hot_regDate=" + hot_regDate + ", hot_viewCnt="
				+ hot_viewCnt + ", hot_likes=" + hot_likes + ", hot_dislikes=" + hot_dislikes + ", comt_count="
				+ comt_count + "]";
	}
	
	
}