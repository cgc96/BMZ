package org.justking.homepage.reply.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.justking.homepage.commons.paging.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static final String NAMESPACE = "org.justking.homepage.sql.reply";
	
	private final SqlSession sqlSession;
	
	@Inject
	public ReplyDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ReplyDTO> listPaing(Integer articleNo, Criteria criteria) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("articleNo",articleNo);
		paramMap.put("criteria", criteria);
		
		return sqlSession.selectList(NAMESPACE + ".listPaging",paramMap);
	}
	
	@Override
	public int countReply(Integer articleNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countReplies", articleNo);
	}

	@Override
	public void create(ReplyDTO reply) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", reply);
	}

	@Override
	public void update(ReplyDTO reply) throws Exception {
		sqlSession.update(NAMESPACE + "update",reply);
	}

	@Override
	public void delete(Integer replyNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", replyNo);
	}


}
