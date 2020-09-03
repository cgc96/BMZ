package org.justking.homepage.board.db;

import java.sql.Date;
import java.util.Arrays;

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
	private String map;
	
	private String[] files;
	private int fileCnt;
	
	private int comt_count;
	
	public int getFileCnt() {
		return fileCnt;
	}

	

	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
		setFileCnt(files.length);
	}
	
	private void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	
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
	
	
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [articleNo=" + articleNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", likes=" + likes + ", dislikes=" + dislikes
				+ ", gu=" + gu + ", map=" + map + ", files=" + Arrays.toString(files) + ", fileCnt=" + fileCnt
				+ ", comt_count=" + comt_count + "]";
	}
	
}