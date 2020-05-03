package org.justking.homepage.board.controller;

import javax.inject.Inject;

import org.justking.homepage.board.db.BoardDTO;
import org.justking.homepage.board.service.BoardService;
import org.justking.homepage.commons.paging.Criteria;
import org.justking.homepage.commons.paging.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/sasang/*")
public class SasangController {
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@Inject
	public SasangController(BoardService boardService) {
		this.boardService = boardService;
	}
	

	// 게시물 비추천 관련 메소드
	@RequestMapping(value = "/nonrecommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String nonrecommend(@RequestParam int articleNo, RedirectAttributes redirectAttributes) throws Exception{
		boardService.nonrecommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","nonliSuccess");

		return "redirect:/sasang/sasang";
	}
	// 게시물 추천 관련 메소드
	@RequestMapping(value = "/recommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String recommend(@RequestParam int articleNo, BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		boardService.recommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","liSuccess");
		boardService.hotcreate(board);
		
		return "redirect:/sasang/sasang";
	}
	//등록 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("wrtie GET...");
		return "/sasang/write";
	}
	
	//등록 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("write POST...");
		logger.info(board.toString());
		boardService.create11(board);
		redirectAttributes.addFlashAttribute("msg","regSuccess");
		
		return "redirect:/sasang/sasang";
	}
	
//	//목록 페이지 이동
//	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
//	public String list(Model model) throws Exception{
//		
//		logger.info("list...");
//		model.addAttribute("boards",boardService.listAll());
//		
//		return "/board/list";
//	}
	
//	//페이징 처리
//	@RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
//	public String listCriteria(Model model, Criteria criteria) throws Exception{
//		
//		logger.info("listCriteria...");
//		model.addAttribute("boards",boardService.listCriteria(criteria));
//		return "/board/list_criteria";
//	}	
	
	//강서구 게시판 페이지
	@RequestMapping(value = "/sasang", method = RequestMethod.GET)
	public String geumjeong(Model model, Criteria criteria) throws Exception{
		
		logger.info("sasang...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		
		model.addAttribute("boards",boardService.sasanglistCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/sasang/sasang";
	}	
	


	//조회 페이지 이동
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, 
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board", boardService.read(articleNo));
		
		return "/sasang/read";
	}

	//수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("modifyGet...");
		model.addAttribute("board",boardService.read(articleNo));
		
		return "/sasang/modify";
	}
	
	//수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO board, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("modifyPOST...");
		boardService.update(board);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSucccess");
		
		return "redirect:/sasang/sasang";
	}
	
	//삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, 
			Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("remove...");
		boardService.delete(articleNo);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSucccess");
		return "redirect:/sasang/sasang";
	}
}
