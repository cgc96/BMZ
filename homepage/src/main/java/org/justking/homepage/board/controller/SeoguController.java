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
@RequestMapping("/seogu/*")
public class SeoguController {
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@Inject
	public SeoguController(BoardService boardService) {
		this.boardService = boardService;
	}
	

	// �Խù� ����õ ���� �޼ҵ�
	@RequestMapping(value = "/nonrecommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String nonrecommend(@RequestParam int articleNo, RedirectAttributes redirectAttributes) throws Exception{
		boardService.nonrecommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","nonliSuccess");

		return "redirect:/seogu/seogu";
	}
	// �Խù� ��õ ���� �޼ҵ�
	@RequestMapping(value = "/recommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String recommend(@RequestParam int articleNo, BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		boardService.recommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","liSuccess");
		boardService.hotcreate(board);
		
		return "redirect:/seogu/seogu";
	}
	//��� ������ �̵�
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("wrtie GET...");
		return "/seogu/write";
	}
	
	//��� ó��
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("write POST...");
		logger.info(board.toString());
		boardService.create12(board);
		redirectAttributes.addFlashAttribute("msg","regSuccess");
		
		return "redirect:/seogu/seogu";
	}
	
//	//��� ������ �̵�
//	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
//	public String list(Model model) throws Exception{
//		
//		logger.info("list...");
//		model.addAttribute("boards",boardService.listAll());
//		
//		return "/board/list";
//	}
	
//	//����¡ ó��
//	@RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
//	public String listCriteria(Model model, Criteria criteria) throws Exception{
//		
//		logger.info("listCriteria...");
//		model.addAttribute("boards",boardService.listCriteria(criteria));
//		return "/board/list_criteria";
//	}	
	
	//������ �Խ��� ������
	@RequestMapping(value = "/seogu", method = RequestMethod.GET)
	public String geumjeong(Model model, Criteria criteria) throws Exception{
		
		logger.info("seogu...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		
		model.addAttribute("boards",boardService.seogulistCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/seogu/seogu";
	}	
	


	//��ȸ ������ �̵�
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, 
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board", boardService.read(articleNo));
		
		return "/seogu/read";
	}

	//���� ������ �̵�
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("modifyGet...");
		model.addAttribute("board",boardService.read(articleNo));
		
		return "/seogu/modify";
	}
	
	//���� ó��
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO board, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("modifyPOST...");
		boardService.update(board);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSucccess");
		
		return "redirect:/seogu/seogu";
	}
	
	//���� ó��
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, 
			Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("remove...");
		boardService.delete(articleNo);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSucccess");
		return "redirect:/seogu/seogu";
	}
}