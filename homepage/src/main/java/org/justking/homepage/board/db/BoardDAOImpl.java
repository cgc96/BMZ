package org.justking.homepage.board.db;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.justking.homepage.commons.paging.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	private static final String NAMESPACE = "org.justking.homepage.sql.board";
	private final SqlSession sqlSession;
	
	@Inject
	public BoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void create(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", board);
	}

	@Override
	public BoardDTO read(Integer articleNo) throws Exception {
		return 	sqlSession.selectOne(NAMESPACE + ".read",articleNo);

	}

	@Override
	public void update(BoardDTO board) throws Exception {
		sqlSession.update(NAMESPACE + ".update",board);
		
	}

	@Override
	public void delete(Integer articleNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete",articleNo);

	}

//	@Override
//	public List<BoardDTO> listAll() throws Exception {
//		return 	sqlSession.selectList(NAMESPACE + ".listAll");
//
//	}

	@Override
	public void updateViewCnt(int articleNo) throws Exception {
		sqlSession.update(NAMESPACE +".updateViewCnt", articleNo);
	}

	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".listPaging", criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles",criteria);
	}
	
	
}