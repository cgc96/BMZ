package org.justking.homepage.board.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.inject.Inject;

import org.justking.homepage.board.db.BoardDAO;
import org.justking.homepage.board.db.BoardDTO;
import org.justking.homepage.commons.paging.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	private final BoardDAO boardDAO;
	
	@Inject
	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public void create(BoardDTO board) throws Exception {
		boardDAO.create(board);
		
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardDTO read(Integer articleNo) throws Exception {
		boardDAO.updateViewCnt(articleNo);
		return boardDAO.read(articleNo);
	}

	@Override
	public void update(BoardDTO board) throws Exception {
		boardDAO.update(board);
	}

	@Override
	public void delete(Integer articleNo) throws Exception {
		boardDAO.delete(articleNo);
		
	}

//	@Override
//	public List<BoardDTO> listAll() throws Exception {
//		return boardDAO.listAll();
//	}

	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) throws Exception {
		return boardDAO.listCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return boardDAO.countArticles(criteria);
	}
	
	
}