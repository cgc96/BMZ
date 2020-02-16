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
	void updateViewCnt(Integer articleNo) throws Exception;
	
	//페이징 처리
	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;
	
	//페이징 처리
	List<BoardDTO> hotlistCriteria(Criteria criteria) throws Exception;
		
	// 전체 게시글 개수
	int countArticles(Criteria criteria) throws Exception;
	
	// 게시글 좋아요 
	void recommend(Integer articleNo) throws Exception;
	
	void nonrecommend(Integer articleNo) throws Exception;
	
	void hotcreate(BoardDTO board) throws Exception;
}
