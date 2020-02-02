package org.justking.homepage.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.justking.homepage.commons.paging.Criteria;
import org.justking.homepage.commons.paging.PageMaker;
import org.justking.homepage.reply.db.ReplyDTO;
import org.justking.homepage.reply.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	@Inject
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	// 댓글 등록처리 메서드
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyDTO reply){
		ResponseEntity<String> entity = null;
		try {
			replyService.create(reply);
			entity = new ResponseEntity<>("regSuccess",HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	// 댓글 목록 메서드
//	@RequestMapping(value = "/all/{articleNo}", method = RequestMethod.GET)
//	public ResponseEntity<List<ReplyDTO>> list(@PathVariable("articleNo") Integer articleNo){
//		ResponseEntity<List<ReplyDTO>> entity = null;
//		try {
//			entity = new ResponseEntity<>(replyService.listPaging(articleNo, c),HttpStatus.OK);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
	
	// 댓글 페이징 처리 메서드
	@RequestMapping(value = "/{articleNo}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPaging(@PathVariable("articleNo") Integer articleNo,
														@PathVariable("page") Integer page){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria criteria =new Criteria();
			criteria.setPage(page);
			
			List<ReplyDTO> replies = replyService.listPaging(articleNo, criteria);
			int repliesCount = replyService.countReplies(articleNo);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(repliesCount);
			
			Map<String, Object> map = new HashMap<>();
			map.put("replies", replies);
			map.put("pageMake", pageMaker);
			
			entity = new ResponseEntity<>(map ,HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 수정처리 메서드
	@RequestMapping(value = "/{replyNo}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("replyNo") Integer replyNo,@RequestBody ReplyDTO reply){
		ResponseEntity<String> entity = null;
		try {
			reply.setReplyNo(replyNo);
			replyService.update(reply);
			entity = new ResponseEntity<>("modSuccess",HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 수정처리 메서드
	@RequestMapping(value = "/{replyNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("replyNo") Integer replyNo){
		ResponseEntity<String> entity = null;
		try {
			replyService.delete(replyNo);
			entity = new ResponseEntity<>("delSuccess",HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
