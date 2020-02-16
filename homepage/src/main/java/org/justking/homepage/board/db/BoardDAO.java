package org.justking.homepage.board.db;

import java.util.List;

import org.justking.homepage.commons.paging.Criteria;

public interface BoardDAO {
	
	//�Խñ� �ۼ�
	void create(BoardDTO board) throws Exception;
	
	BoardDTO read(Integer articleNo) throws Exception;
	
	void update(BoardDTO board) throws Exception;
	
	void delete(Integer articleNo) throws Exception;
	
//	//�Խù� ��� ��ȸ
//	List<BoardDTO> listAll() throws Exception;
//	
	//�Խñ� ��ȸ up
	void updateViewCnt(Integer articleNo) throws Exception;
	
	//����¡ ó��
	List<BoardDTO> listCriteria(Criteria criteria) throws Exception;
	
	//����¡ ó��
	List<BoardDTO> hotlistCriteria(Criteria criteria) throws Exception;
		
	// ��ü �Խñ� ����
	int countArticles(Criteria criteria) throws Exception;
	
	// �Խñ� ���ƿ� 
	void recommend(Integer articleNo) throws Exception;
	
	void nonrecommend(Integer articleNo) throws Exception;
	
	void hotcreate(BoardDTO board) throws Exception;
}
