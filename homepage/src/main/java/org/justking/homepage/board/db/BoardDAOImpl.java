package org.justking.homepage.board.db;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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

	@Override
	public void updateViewCnt(Integer articleNo) throws Exception {
		sqlSession.update(NAMESPACE +".updateViewCnt", articleNo);
	}

	@Override
	public List<BoardDTO> listCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".listPaging", criteria);
	}
	
	@Override
	public List<BoardDTO> geumjeonglistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".geumjeong", criteria);
	}
	
	@Override
	public List<BoardDTO> gangseolistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".gangseo", criteria);
	}
	
	@Override
	public List<BoardDTO> namgulistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".namgu", criteria);
	}
	
	@Override
	public List<BoardDTO> haeundaelistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".haeundae", criteria);
	}
	
	@Override
	public List<BoardDTO> bukgulistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".bukgu", criteria);
	}

	@Override
	public List<BoardDTO> busanjinlistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".busanjin", criteria);
	}
	
	@Override
	public List<BoardDTO> donggulistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".donggu", criteria);
	}
	
	@Override
	public List<BoardDTO> dongnaelistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".dongnae", criteria);
	}
	
	@Override
	public List<BoardDTO> gijanglistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".gijang", criteria);
	}
	
	@Override
	public List<BoardDTO> junggulistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".junggu", criteria);
	}
	
	@Override
	public List<BoardDTO> sahalistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".saha", criteria);
	}
	
	@Override
	public List<BoardDTO> sasanglistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".sasang", criteria);
	}
	
	@Override
	public List<BoardDTO> seogulistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".seogu", criteria);
	}
	
	@Override
	public List<BoardDTO> suyeonglistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".suyeong", criteria);
	}
	
	@Override
	public List<BoardDTO> yeongdolistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".yeongdo", criteria);
	}
	
	@Override
	public List<BoardDTO> yeonjelistCriteria(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".yeonje", criteria);
	}
	
	@Override
	public int countArticles(String gu) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles", gu);
	}

	@Override
	public void recommend(Integer articleNo) throws Exception {
		sqlSession.update(NAMESPACE +".recommend", articleNo);
		
	}

	@Override
	public void nonrecommend(Integer articleNo) throws Exception {
		sqlSession.update(NAMESPACE +".nonrecommend", articleNo);
		
	}

	@Override
	public void create1(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".1create", board);
	}

	@Override
	public void create6(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".6create", board);
		
	}

	@Override
	public void create3(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".3create", board);
		
	}
	
	@Override
	public void create15(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".15create", board);
		
	}
	
	@Override
	public void create2(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".2create", board);
		
	}
	
	@Override
	public void create4(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".4create", board);
		
	}
	
	@Override
	public void create5(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".5create", board);
		
	}
	
	@Override
	public void create7(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".7create", board);
		
	}
	
	@Override
	public void create8(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".8create", board);
		
	}
	
	@Override
	public void create9(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".9create", board);
		
	}
	
	@Override
	public void create10(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".10create", board);
		
	}
	
	@Override
	public void create11(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".11create", board);
		
	}
	
	@Override
	public void create12(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".12create", board);
		
	}
	
	@Override
	public void create13(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".13create", board);
		
	}
	
	@Override
	public void create14(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".14create", board);
		
	}
	
	
	@Override
	public void create16(BoardDTO board) throws Exception {
		sqlSession.insert(NAMESPACE + ".16create", board);
		
	}
	
}