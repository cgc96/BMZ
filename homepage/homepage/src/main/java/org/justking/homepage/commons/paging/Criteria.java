package org.justking.homepage.commons.paging;

/*
 page : 현재 페이지 번호
 perPageNum : 페이지 당 출력되는 게시글의 갯수
 Criteria(): 기본 생성자, 현재페이지를 1, 페이지 당 출력할 게시글의 갯수를 10으로 세팅
 set메서드 : 음수와 같은 잘못된 값이 들어오지 않도록 validation 체크를 통해 적절한 값으로 세팅
 get메서드: SQL Mapper가 사용할 get메서드를 정의
 */
public class Criteria {
	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if(page<=0) {
			this.page =1;
			return ;
		}
		
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum >100) {
			this.perPageNum = 10;
			return ;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	// 현재 페이지의 시작 게시글 번호 = (현재 페이지번호 - 1) * 페이지 당 출력할 게시글의 개수
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
