package org.justking.homepage.board.service;

import java.util.List;

import org.justking.homepage.board.db.BoardDTO;
import org.justking.homepage.commons.paging.Criteria;

public interface BoardService {

	void create(BoardDTO board) throws Exception;
	
	BoardDTO read(Integer articleNo) throws Exception;
	
	void update(BoardDTO board) throws Exception;
	
	void delete(Integer articleNo) throws Exception;
	
//	List<BoardDTO> listAll() throws Exception;

	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;
	
	int countArticles(Criteria criteria) throws Exception;
}
