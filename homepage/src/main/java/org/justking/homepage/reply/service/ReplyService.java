package org.justking.homepage.reply.service;

import java.util.List;

import org.justking.homepage.commons.paging.Criteria;
import org.justking.homepage.reply.db.ReplyDTO;

public interface ReplyService {
	
	List<ReplyDTO> listPaging(Integer articleNo, Criteria criteria) throws Exception;
	
	int countReplies(Integer articleNo) throws Exception;
	
	void create(ReplyDTO reply) throws Exception;
	
	void update(ReplyDTO reply) throws Exception;
	
	void delete(Integer replyNo) throws Exception;
}
