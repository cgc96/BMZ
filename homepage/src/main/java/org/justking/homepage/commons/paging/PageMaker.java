package org.justking.homepage.commons.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	private Criteria criteria;
	
	public void setCriteria(Criteria critera) {
		this.criteria = critera;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(criteria.getPage()/(double) displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		setPrev(startPage == 1? false : true);
		
		setNext(endPage * criteria.getPerPageNum() >= totalCount ? false : true);
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", criteria.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
}
