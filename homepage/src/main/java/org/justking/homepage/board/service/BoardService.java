package org.justking.homepage.board.service;

import org.justking.homepage.board.db.BoardDTO;

public interface BoardService {

	int board_write(BoardDTO board) throws Exception;

}
