package org.justking.homepage.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.justking.homepage.commons.paging.Criteria;
import org.justking.homepage.reply.db.ReplyDAO;
import org.justking.homepage.reply.db.ReplyDTO;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	private final ReplyDAO replyDAO;
	
	@Inject
	public ReplyServiceImpl(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	@Override
	public List<ReplyDTO> listPaging(Integer articleNo, Criteria criteria) throws Exception {
		return replyDAO.listPaing(articleNo, criteria);
	}
	
	@Override
	public int countReplies(Integer articleNo) throws Exception {
		return replyDAO.countReply(articleNo);
	}

	@Override
	public void create(ReplyDTO reply) throws Exception {
		replyDAO.create(reply);
	}

	@Override
	public void update(ReplyDTO reply) throws Exception {
		replyDAO.update(reply);
	}

	@Override
	public void delete(Integer replyNo) throws Exception {
		replyDAO.delete(replyNo);
	}



}
