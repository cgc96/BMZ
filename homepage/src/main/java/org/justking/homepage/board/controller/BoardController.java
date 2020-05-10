<<<<<<< HEAD
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
	

	// °Ô½Ã¹° ºñÃßÃµ °ü·Ã ¸Ş¼Òµå
	@RequestMapping(value = "/nonrecommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String nonrecommend(@RequestParam int articleNo, RedirectAttributes redirectAttributes) throws Exception{
		boardService.nonrecommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","nonliSuccess");

		return "redirect:/board/listPaging";
	}
	// °Ô½Ã¹° ÃßÃµ °ü·Ã ¸Ş¼Òµå
	@RequestMapping(value = "/recommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String recommend(@RequestParam int articleNo, BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		boardService.recommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","liSuccess");
		boardService.hotcreate(board);
		
		return "redirect:/board/listPaging";
	}
	//µî·Ï ÆäÀÌÁö ÀÌµ¿
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("wrtie GET...");
		return "/board/write";
	}
	
	//µî·Ï Ã³¸®
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("write POST...");
		logger.info(board.toString());
		boardService.create(board);
		redirectAttributes.addFlashAttribute("msg","regSuccess");
		
		return "redirect:/board/listPaging";
	}
	
//	//¸ñ·Ï ÆäÀÌÁö ÀÌµ¿
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list(Model model) throws Exception{
//		
//		logger.info("list...");
//		model.addAttribute("boards",boardService.listAll());
//		
//		return "/board/list";
//	}
	
//	//ÆäÀÌÂ¡ Ã³¸®
//	@RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
//	public String listCriteria(Model model, Criteria criteria) throws Exception{
//		
//		logger.info("listCriteria...");
//		model.addAttribute("boards",boardService.listCriteria(criteria));
//		return "/board/list_criteria";
//	}	
	
	//±İÁ¤±¸ °Ô½ÃÆÇ ÆäÀÌÁö
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
	
	//³²±¸ °Ô½ÃÆÇ ÆäÀÌÁö
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
	
	//ÆäÀÌÁö ¹øÈ£ Ãâ·Â, ¸ñ·ÏÆäÀÌÁö
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
	
	//ÆäÀÌÁö ¹øÈ£ Ãâ·Â, ÇÖ¸ñ·ÏÆäÀÌÁö
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
	
//	//Á¶È¸ ÆäÀÌÁö ÀÌµ¿
//	@RequestMapping(value = "/read", method = RequestMethod.GET)
//	public String read(@RequestParam("articleNo") int articleNo, 
//			Model model) throws Exception{
//		
//		logger.info("read...");
//		model.addAttribute("board", boardService.read(articleNo));
//		
//		return "/board/read";
//	}

	//Á¶È¸ ÆäÀÌÁö ÀÌµ¿
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, 
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board", boardService.read(articleNo));
		
		return "/board/read";
	}

	//¼öÁ¤ ÆäÀÌÁö ÀÌµ¿
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("modifyGet...");
		model.addAttribute("board",boardService.read(articleNo));
		
		return "/board/modify";
	}
	
	//¼öÁ¤ Ã³¸®
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO board, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("modifyPOST...");
		boardService.update(board);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSucccess");
		
		return "redirect:/board/listPaging";
	}
	
	//»èÁ¦ Ã³¸®
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
	
	
=======
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
	

	// ï¿½Ô½Ã¹ï¿½ ï¿½ï¿½ï¿½ï¿½Ãµ ï¿½ï¿½ï¿½ï¿½ ï¿½Ş¼Òµï¿½
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
		boardService.hotcreate(board);
		
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
	
//	//ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list(Model model) throws Exception{
//		
//		logger.info("list...");
//		model.addAttribute("boards",boardService.listAll());
//		
//		return "/board/list";
//	}
	
//	//ï¿½ï¿½ï¿½ï¿½Â¡ Ã³ï¿½ï¿½
//	@RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
//	public String listCriteria(Model model, Criteria criteria) throws Exception{
//		
//		logger.info("listCriteria...");
//		model.addAttribute("boards",boardService.listCriteria(criteria));
//		return "/board/list_criteria";
//	}	
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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
	
	//ï¿½ï¿½ï¿½ï¿½ ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£ ï¿½ï¿½ï¿½, ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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
	
	//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£ ï¿½ï¿½ï¿½, ï¿½Ö¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
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
	
//	//ï¿½ï¿½È¸ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½
//	@RequestMapping(value = "/read", method = RequestMethod.GET)
//	public String read(@RequestParam("articleNo") int articleNo, 
//			Model model) throws Exception{
//		
//		logger.info("read...");
//		model.addAttribute("board", boardService.read(articleNo));
//		
//		return "/board/read";
//	}

	//ï¿½ï¿½È¸ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, 
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board", boardService.read(articleNo));
		
		return "/board/read";
	}

	//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("modifyGet...");
		model.addAttribute("board",boardService.read(articleNo));
		
		return "/board/modify";
	}
	
	//ï¿½ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO board, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("modifyPOST...");
		boardService.update(board);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSucccess");
		
		return "redirect:/board/listPaging";
	}
	
	//ï¿½ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½
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
	
	
>>>>>>> master
}