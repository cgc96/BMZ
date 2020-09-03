package org.justking.homepage.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("/Gu/geumjeong/*")
public class GeumjeongController {
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@Inject
	public GeumjeongController(BoardService boardService) {
		this.boardService = boardService;
	}
	

	@RequestMapping(value = "/nonrecommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String nonrecommend(@RequestParam int articleNo, RedirectAttributes redirectAttributes) throws Exception{
		boardService.nonrecommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","nonliSuccess");

		return "redirect:/Gu/geumjeong/geumjeong";
	}
	@RequestMapping(value = "/recommend", method = {RequestMethod.GET, RequestMethod.POST})
	public String recommend(@RequestParam int articleNo, BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		boardService.recommend(articleNo);
		redirectAttributes.addFlashAttribute("msg","liSuccess");
		
		return "redirect:/Gu/geumjeong/geumjeong";
	}
  
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET(String id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(id);
		if(id.equals("null")) {
			out.println("<script>");
			out.println("alert('로그인 후 글작성 가능합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return "redirect:/Gu/geumjeong/geumjeong";
		}
		
		logger.info("wrtie GET...");
		return "/Gu/geumjeong/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardDTO board, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("write POST...");
		logger.info(board.toString());
		boardService.create1(board);
		redirectAttributes.addFlashAttribute("msg","regSuccess");
		
		return "redirect:/Gu/geumjeong/geumjeong";
	}
	
	
	@RequestMapping(value = "/geumjeong", method = RequestMethod.GET)
	public String geumjeong(Model model, Criteria criteria) throws Exception{
		
		logger.info("geumjeong...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles("geumjeong"));
		
		model.addAttribute("boards",boardService.geumjeonglistCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		
		return "/Gu/geumjeong/geumjeong";
	}	
	


	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, 
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board", boardService.read(articleNo));
		
		return "/Gu/geumjeong/read";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo,
			@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception{
		
		logger.info("modifyGet...");
		model.addAttribute("board",boardService.read(articleNo));
		
		return "/Gu/geumjeong/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardDTO board, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("modifyPOST...");
		boardService.update(board);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSucccess");
		
		return "redirect:/Gu/geumjeong/geumjeong";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, 
			Criteria criteria, RedirectAttributes redirectAttributes) throws Exception{
		
		logger.info("remove...");
		boardService.delete(articleNo);
		redirectAttributes.addAttribute("page",criteria.getPage());
		redirectAttributes.addAttribute("perPageNum",criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSucccess");
		return "redirect:/Gu/geumjeong/geumjeong";
	}
}
