package org.justking.homepage.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.justking.homepage.board.db.BoardDAO;
import org.justking.homepage.board.db.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO manager;
	
	// 게시판 글 작성
	@Override
	public int board_write(BoardDTO board) throws Exception {
		return manager.board_write(board);
	}
}