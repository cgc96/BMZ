package org.justking.homepage.board.db;

import java.util.List;

import org.justking.homepage.commons.paging.Criteria;

public interface BoardDAO {
	
	//占쌉시깍옙 占쌜쇽옙
	void create(BoardDTO board) throws Exception;
	
	BoardDTO read(Integer articleNo) throws Exception;
	
	void update(BoardDTO board) throws Exception;
	
	void delete(Integer articleNo) throws Exception;
	
//	//占쌉시뱄옙 占쏙옙占� 占쏙옙회
//	List<BoardDTO> listAll() throws Exception;
//	
	//占쌉시깍옙 占쏙옙회 up
	void updateViewCnt(Integer articleNo) throws Exception;
	
	//占쏙옙占쏙옙징 처占쏙옙
	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;

	// 占쏙옙체 占쌉시깍옙 占쏙옙占쏙옙
	int countArticles(String gu) throws Exception;
	
	// 占쌉시깍옙 占쏙옙占싣울옙 
	void recommend(Integer articleNo) throws Exception;
	
	void nonrecommend(Integer articleNo) throws Exception;

	//占쏙옙占쏙옙占쏙옙 占쌉쏙옙占쏙옙
	List<BoardDTO> geumjeonglistCriteria(Criteria criteria) throws Exception;
	
	void create1(BoardDTO board) throws Exception;
	
	List<BoardDTO> gangseolistCriteria(Criteria criteria) throws Exception;
	
	void create6(BoardDTO board) throws Exception;

	List<BoardDTO> namgulistCriteria(Criteria criteria) throws Exception;

	void create3(BoardDTO board) throws Exception;

	List<BoardDTO> haeundaelistCriteria(Criteria criteria) throws Exception;

	void create15(BoardDTO board) throws Exception;
	
	List<BoardDTO> bukgulistCriteria(Criteria criteria) throws Exception;

	void create2(BoardDTO board) throws Exception;

	List<BoardDTO> busanjinlistCriteria(Criteria criteria) throws Exception;

	void create4(BoardDTO board) throws Exception;
	
	List<BoardDTO> donggulistCriteria(Criteria criteria) throws Exception;

	void create5(BoardDTO board) throws Exception;

	List<BoardDTO> dongnaelistCriteria(Criteria criteria) throws Exception;

	void create7(BoardDTO board) throws Exception;
	
	List<BoardDTO> gijanglistCriteria(Criteria criteria) throws Exception;

	void create8(BoardDTO board) throws Exception;
	
	List<BoardDTO> junggulistCriteria(Criteria criteria) throws Exception;

	void create9(BoardDTO board) throws Exception;
	
	List<BoardDTO> sahalistCriteria(Criteria criteria) throws Exception;

	void create10(BoardDTO board) throws Exception;
	
	List<BoardDTO> sasanglistCriteria(Criteria criteria) throws Exception;

	void create11(BoardDTO board) throws Exception;
	
	List<BoardDTO> seogulistCriteria(Criteria criteria) throws Exception;

	void create12(BoardDTO board) throws Exception;
	
	List<BoardDTO> suyeonglistCriteria(Criteria criteria) throws Exception;

	void create13(BoardDTO board) throws Exception;
	
	List<BoardDTO> yeongdolistCriteria(Criteria criteria) throws Exception;

	void create14(BoardDTO board) throws Exception;
	
	List<BoardDTO> yeonjelistCriteria(Criteria criteria) throws Exception;

	void create16(BoardDTO board) throws Exception;
}
