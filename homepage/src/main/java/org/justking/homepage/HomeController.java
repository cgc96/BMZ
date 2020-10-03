package org.justking.homepage;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.justking.homepage.board.service.BoardService;
import org.justking.homepage.commons.paging.Criteria;
import org.justking.homepage.commons.paging.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private final BoardService boardService;
	
	@Inject
	public HomeController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Criteria criteria) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		makeBukguBoard(model, criteria);
		
		makeGeumjeongBoard(model, criteria);
		
		makeYeonjeBoard(model, criteria);
		
		makeYeongdoBoard(model, criteria);
		
		makeSuyeongBoard(model, criteria);
		
		makeSeoguBoard(model, criteria);
		
		makeSasangBoard(model, criteria);
		
		makeSahaBoard(model, criteria);
		
		makeNamguBoard(model, criteria);
		
		makeJungguBoard(model, criteria);
		
		makeHaeundaeBoard(model, criteria);
		
		makeGangseoBoard(model, criteria);
		
		makeDongnaeBoard(model, criteria);
		
		makeDongguBoard(model, criteria);
		
		makeBusanjinBoard(model, criteria);
		
		return "home";
	}

	private void makeBusanjinBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("busanjin"));
//		
//		model.addAttribute("busanjin_pageMaker",pageMaker);
		model.addAttribute("busanjin_boards",boardService.get5Articles("busanjin"));
		System.out.println(boardService.get5Articles("busanjin").size());
	}

	private void makeDongguBoard(Model model, Criteria criteria) throws Exception {
//	PageMaker pageMaker = new PageMaker();
//	pageMaker.setCriteria(criteria);
//	pageMaker.setTotalCount(boardService.countArticles("donggu"));
//	
//	model.addAttribute("donggu_pageMaker",pageMaker);
	model.addAttribute("donggu_boards",boardService.get5Articles("donggu"));
	}

	private void makeDongnaeBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("dongnae"));
//		
//		model.addAttribute("dongnae_pageMaker",pageMaker);
		model.addAttribute("dongnae_boards",boardService.get5Articles("dongnae"));
	}

	private void makeGangseoBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("gangseo"));
//		
//		model.addAttribute("gangseo_pageMaker",pageMaker);
		model.addAttribute("gangseo_boards",boardService.get5Articles("gangseo"));
	}

	private void makeHaeundaeBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("haeundae"));
//		
//		model.addAttribute("haeundae_pageMaker",pageMaker);
		model.addAttribute("haeundae_boards",boardService.get5Articles("haeundae"));
	}

	private void makeJungguBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("junggu"));
//		
//		model.addAttribute("junggu_pageMaker",pageMaker);
		model.addAttribute("junggu_boards",boardService.get5Articles("junggu"));
	}

	private void makeNamguBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("namgu"));
//		
//		model.addAttribute("namgu_pageMaker",pageMaker);
		model.addAttribute("namgu_boards",boardService.get5Articles("namgu"));
	}

	private void makeSahaBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("saha"));
//		
//		model.addAttribute("saha_pageMaker",pageMaker);
		model.addAttribute("saha_boards",boardService.get5Articles("saha"));
	}

	private void makeSasangBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("sasang"));
//		
//		model.addAttribute("sasang_pageMaker",pageMaker);
		model.addAttribute("sasang_boards",boardService.get5Articles("sasang"));
	}

	private void makeSeoguBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("seogu"));
//		
//		model.addAttribute("seogu_pageMaker",pageMaker);
		model.addAttribute("seogu_boards",boardService.get5Articles("seogu"));
	}

	private void makeSuyeongBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("suyeong"));
//		
//		model.addAttribute("suyeong_pageMaker",pageMaker);
		model.addAttribute("suyeong_boards",boardService.get5Articles("suyeong"));
	}

	private void makeYeongdoBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("yeongdo"));
//		
//		model.addAttribute("yeongdo_pageMaker",pageMaker);
		model.addAttribute("yeongdo_boards",boardService.get5Articles("yeongdo"));
	}

	private void makeYeonjeBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("yeonje"));
//		
//		model.addAttribute("yeonje_pageMaker",pageMaker);
		model.addAttribute("yeonje_boards",boardService.get5Articles("yeonje"));
	}

	private void makeGeumjeongBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("geumjung"));
//		
//		model.addAttribute("geumjung_pageMaker",pageMaker);
		model.addAttribute("guemjung_boards",boardService.get5Articles("geumjung"));
	}

	private void makeBukguBoard(Model model, Criteria criteria) throws Exception {
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCriteria(criteria);
//		pageMaker.setTotalCount(boardService.countArticles("bukgu"));
//		
//		model.addAttribute("bukgu_pageMaker",pageMaker);
		model.addAttribute("bukgu_boards",boardService.get5Articles("bukgu"));
	}
	
}
