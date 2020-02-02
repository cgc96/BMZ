package org.justking.homepage.board.db;

import java.util.List;

import org.justking.homepage.commons.paging.Criteria;

public interface BoardDAO {
	
	//게시글 작성
	void create(BoardDTO board) throws Exception;
	
	BoardDTO read(Integer articleNo) throws Exception;
	
	void update(BoardDTO board) throws Exception;
	
	void delete(Integer articleNo) throws Exception;
	
//	//게시물 목록 조회
//	List<BoardDTO> listAll() throws Exception;
//	
	//게시글 조회 up
	void updateViewCnt(int articleNo) throws Exception;
	
	//페이징 처리
	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;
	
	// 전체 게시글 개수
	int countArticles(Criteria criteria) throws Exception;
}
