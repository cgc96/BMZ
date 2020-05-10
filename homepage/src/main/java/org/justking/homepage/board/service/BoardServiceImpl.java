<<<<<<< HEAD
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
	public List<BoardDTO> hotlistCriteria(Criteria criteria) throws Exception {
		return boardDAO.hotlistCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return boardDAO.countArticles(criteria);
	}

	@Override
	public void recommend(Integer articleNo) throws Exception {
		boardDAO.recommend(articleNo);
		
	}

	@Override
	public void nonrecommend(Integer articleNo) throws Exception {
		boardDAO.nonrecommend(articleNo);
		
	}

	@Override
	public void hotcreate(BoardDTO board) throws Exception {
		boardDAO.hotcreate(board);
	}

	@Override
	public List<BoardDTO> geumjeonglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.geumjeonglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> gangseolistCriteria(Criteria criteria) throws Exception {
		return boardDAO.gangseolistCriteria(criteria);
	}

	@Override
	public List<BoardDTO> namgulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.namgulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> haeundaelistCriteria(Criteria criteria) throws Exception {
		return boardDAO.haeundaelistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> bukgulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.bukgulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> busanjinlistCriteria(Criteria criteria) throws Exception {
		return boardDAO.busanjinlistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> donggulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.donggulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> dongnaelistCriteria(Criteria criteria) throws Exception {
		return boardDAO.dongnaelistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> gijanglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.gijanglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> junggulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.junggulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> sahalistCriteria(Criteria criteria) throws Exception {
		return boardDAO.sahalistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> sasanglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.sasanglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> seogulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.seogulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> suyeonglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.suyeonglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> yeongdolistCriteria(Criteria criteria) throws Exception {
		return boardDAO.yeongdolistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> yeonjelistCriteria(Criteria criteria) throws Exception {
		return boardDAO.yeonjelistCriteria(criteria);
	}
	
	@Override
	public void create1(BoardDTO board) throws Exception {
		boardDAO.create1(board);
		
	}
	
	@Override
	public void create6(BoardDTO board) throws Exception {
		boardDAO.create6(board);
		
	}

	@Override
	public void create3(BoardDTO board) throws Exception {
		boardDAO.create3(board);
		
	}
	
	@Override
	public void create15(BoardDTO board) throws Exception {
		boardDAO.create15(board);
		
	}
	
	@Override
	public void create2(BoardDTO board) throws Exception {
		boardDAO.create2(board);
		
	}
	
	@Override
	public void create4(BoardDTO board) throws Exception {
		boardDAO.create4(board);
		
	}
	
	@Override
	public void create5(BoardDTO board) throws Exception {
		boardDAO.create5(board);
		
	}
	
	@Override
	public void create7(BoardDTO board) throws Exception {
		boardDAO.create7(board);
		
	}
	
	@Override
	public void create8(BoardDTO board) throws Exception {
		boardDAO.create8(board);
		
	}
	
	@Override
	public void create9(BoardDTO board) throws Exception {
		boardDAO.create9(board);
		
	}
	
	@Override
	public void create10(BoardDTO board) throws Exception {
		boardDAO.create10(board);
		
	}
	
	@Override
	public void create11(BoardDTO board) throws Exception {
		boardDAO.create11(board);
	}
	
	@Override
	public void create12(BoardDTO board) throws Exception {
		boardDAO.create12(board);
		
	}
	
	@Override
	public void create13(BoardDTO board) throws Exception {
		boardDAO.create13(board);
		
	}
		
	@Override
	public void create14(BoardDTO board) throws Exception {
		boardDAO.create14(board);
		
	}
	
	@Override
	public void create16(BoardDTO board) throws Exception {
		boardDAO.create16(board);
		
	}
=======
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
	public List<BoardDTO> hotlistCriteria(Criteria criteria) throws Exception {
		return boardDAO.hotlistCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return boardDAO.countArticles(criteria);
	}

	@Override
	public void recommend(Integer articleNo) throws Exception {
		boardDAO.recommend(articleNo);
		
	}

	@Override
	public void nonrecommend(Integer articleNo) throws Exception {
		boardDAO.nonrecommend(articleNo);
		
	}

	@Override
	public void hotcreate(BoardDTO board) throws Exception {
		boardDAO.hotcreate(board);
	}

	@Override
	public List<BoardDTO> geumjeonglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.geumjeonglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> gangseolistCriteria(Criteria criteria) throws Exception {
		return boardDAO.gangseolistCriteria(criteria);
	}

	@Override
	public List<BoardDTO> namgulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.namgulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> haeundaelistCriteria(Criteria criteria) throws Exception {
		return boardDAO.haeundaelistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> bukgulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.bukgulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> busanjinlistCriteria(Criteria criteria) throws Exception {
		return boardDAO.busanjinlistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> donggulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.donggulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> dongnaelistCriteria(Criteria criteria) throws Exception {
		return boardDAO.dongnaelistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> gijanglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.gijanglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> junggulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.junggulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> sahalistCriteria(Criteria criteria) throws Exception {
		return boardDAO.sahalistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> sasanglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.sasanglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> seogulistCriteria(Criteria criteria) throws Exception {
		return boardDAO.seogulistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> suyeonglistCriteria(Criteria criteria) throws Exception {
		return boardDAO.suyeonglistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> yeongdolistCriteria(Criteria criteria) throws Exception {
		return boardDAO.yeongdolistCriteria(criteria);
	}
	
	@Override
	public List<BoardDTO> yeonjelistCriteria(Criteria criteria) throws Exception {
		return boardDAO.yeonjelistCriteria(criteria);
	}
	
	@Override
	public void create1(BoardDTO board) throws Exception {
		boardDAO.create1(board);
		
	}
	
	@Override
	public void create6(BoardDTO board) throws Exception {
		boardDAO.create6(board);
		
	}

	@Override
	public void create3(BoardDTO board) throws Exception {
		boardDAO.create3(board);
		
	}
	
	@Override
	public void create15(BoardDTO board) throws Exception {
		boardDAO.create15(board);
		
	}
	
	@Override
	public void create2(BoardDTO board) throws Exception {
		boardDAO.create2(board);
		
	}
	
	@Override
	public void create4(BoardDTO board) throws Exception {
		boardDAO.create4(board);
		
	}
	
	@Override
	public void create5(BoardDTO board) throws Exception {
		boardDAO.create5(board);
		
	}
	
	@Override
	public void create7(BoardDTO board) throws Exception {
		boardDAO.create7(board);
		
	}
	
	@Override
	public void create8(BoardDTO board) throws Exception {
		boardDAO.create8(board);
		
	}
	
	@Override
	public void create9(BoardDTO board) throws Exception {
		boardDAO.create9(board);
		
	}
	
	@Override
	public void create10(BoardDTO board) throws Exception {
		boardDAO.create10(board);
		
	}
	
	@Override
	public void create11(BoardDTO board) throws Exception {
		boardDAO.create11(board);
	}
	
	@Override
	public void create12(BoardDTO board) throws Exception {
		boardDAO.create12(board);
		
	}
	
	@Override
	public void create13(BoardDTO board) throws Exception {
		boardDAO.create13(board);
		
	}
		
	@Override
	public void create14(BoardDTO board) throws Exception {
		boardDAO.create14(board);
		
	}
	
	@Override
	public void create16(BoardDTO board) throws Exception {
		boardDAO.create16(board);
		
	}
>>>>>>> master
}