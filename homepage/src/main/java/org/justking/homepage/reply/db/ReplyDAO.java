package org.justking.homepage.reply.db;

import java.util.List;

import org.justking.homepage.commons.paging.Criteria;

public interface ReplyDAO {
	
	List<ReplyDTO> listPaing(Integer articleNo, Criteria criteria) throws Exception;
	
	int countReply(Integer articleNo) throws Exception;
	
	void create(ReplyDTO reply) throws Exception;
	
	void update(ReplyDTO reply) throws Exception;
	
	void delete(Integer replyNo) throws Exception;
	
}
