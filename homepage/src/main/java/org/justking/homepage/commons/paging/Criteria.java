package org.justking.homepage.commons.paging;

/*
 page : ���� ������ ��ȣ
 perPageNum : ������ �� ��µǴ� �Խñ��� ����
 Criteria(): �⺻ ������, ������������ 1, ������ �� ����� �Խñ��� ������ 10���� ����
 set�޼��� : ������ ���� �߸��� ���� ������ �ʵ��� validation üũ�� ���� ������ ������ ����
 get�޼���: SQL Mapper�� ����� get�޼��带 ����
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
	
	// ���� �������� ���� �Խñ� ��ȣ = (���� ��������ȣ - 1) * ������ �� ����� �Խñ��� ����
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
