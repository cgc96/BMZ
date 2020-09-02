package org.justking.homepage.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.justking.homepage.board.db.BoardDTO;
import org.justking.homepage.board.service.BoardService;
import org.justking.homepage.commons.paging.Criteria;
import org.justking.homepage.commons.paging.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@Inject
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	

	// 占쌉시뱄옙 占쏙옙占쏙옙천 占쏙옙占쏙옙 占쌨소듸옙
	@RequestMapping(value = "/nonrecommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String nonrecommend(@RequestParam int articleNo, RedirectAttributes redirectAttributes) throws Exception{
		boardService.nonrecommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","nonliSuccess");

		return "redirect:/board/listPaging";
	}

	@RequestMapping(value = "/recommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String recommend(@RequestParam int articleNo, BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		boardService.recommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","liSuccess");

		return "redirect:/board/listPaging";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("wrtie GET...");
		return "/board/write";
	}


	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("write POST...");
		logger.info(board.toString());
		boardService.create(board);
		redirectAttributes.addFlashAttribute("msg","regSuccess");
		
		return "redirect:/board/listPaging";
	}
	
	/*
	//占쏙옙占쏙옙占쏙옙 占쌉쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/geumjeong", method = RequestMethod.GET)
	public String geumjeong(Model model, Criteria criteria) throws Exception{
		
		logger.info("geumjeong...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		
		model.addAttribute("boards",boardService.listCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/Gu/geumjeong";
	}	
	
	//占쏙옙占쏙옙 占쌉쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/namgu", method = RequestMethod.GET)
	public String namgu(Model model, Criteria criteria) throws Exception{
		
		logger.info("namgu...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		
		model.addAttribute("boards",boardService.listCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/Gu/namgu";
	}	
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙호 占쏙옙占�, 占쏙옙占쏙옙占쏙옙占쏙옙占�
	@RequestMapping(value = "/listPaging", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception{
		
		logger.info("listPaging...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		
		model.addAttribute("boards",boardService.listCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/board/list_paging";
	}	
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙호 占쏙옙占�, 占쌍몌옙占쏙옙占쏙옙占쏙옙占�
	@RequestMapping(value = "/hot_listPaging", method = RequestMethod.GET)
	public String hot_listPaging(Model model, Criteria criteria) throws Exception{
		
		logger.info("hotlistPaging...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		
		model.addAttribute("hotboards",boardService.listCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/board/hot_list";
	}	
	*/
	
//	//占쏙옙회 占쏙옙占쏙옙占쏙옙 占싱듸옙
//	@RequestMapping(value = "/read", method = RequestMethod.GET)
//	public String read(@RequestParam("articleNo") int articleNo, 
//			Model model) throws Exception{
//		
//		logger.info("read...");
//		model.addAttribute("board", boardService.read(articleNo));
//		
//		return "/board/read";
//	}

	//占쏙옙회 占쏙옙占쏙옙占쏙옙 占싱듸옙
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, 
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board", boardService.read(articleNo));
		
		return "/board/read";
	}

	//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱듸옙
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("modifyGet...");
		model.addAttribute("board",boardService.read(articleNo));
		
		return "/board/modify";
	}
	
	//占쏙옙占쏙옙 처占쏙옙
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO board, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("modifyPOST...");
		boardService.update(board);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSucccess");
		
		return "redirect:/board/listPaging";
	}
	
	//占쏙옙占쏙옙 처占쏙옙
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, 
			Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("remove...");
		boardService.delete(articleNo);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSucccess");
		return "redirect:/board/listPaging";
	}
	
	
}