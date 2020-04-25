package org.justking.homepage.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.justking.homepage.commons.interceptor.LoginInterceptor;
import org.justking.homepage.member.db.MemberDTO;
import org.justking.homepage.member.service.MemberService;
import org.justking.homepage.member.service.MemberServiceImpl;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	private MemberService service;
	
	@Inject
	public MemberController(MemberService service) {
		this.service = service;
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public String withdrawal_form(@ModelAttribute("MemberDTO") MemberDTO member, HttpSession session, HttpServletResponse response) throws Exception{
		if(service.withdrawal(member, response)) {
			session.invalidate();
		}
		return "redirect:/MainPage.jsp";
	}
	
	// mypage 수정
	@RequestMapping(value = "/update_mypage.do", method = RequestMethod.POST)
	public String update_mypage(@ModelAttribute("MemberDTO") MemberDTO member, Model model, HttpSession session, RedirectAttributes rttr) throws Exception{
		session.setAttribute("member", service.update_mypage(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:/member/mypage.do";
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.POST)
	public String update_pw(@ModelAttribute("MemberDTO") MemberDTO member,Model model, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
		session.setAttribute("member", service.update_pw(member, old_pw, response));
		rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
		return "redirect:/member/mypage.do";
	}
	
	// 마이페이지 이동
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage() throws Exception{
		return "/member/mypage";
	}
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception{
		service.find_pw(response, member);
	}
		
	// 비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form.do")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", service.find_id(response, email));
		return "/member/find_id";
	}
		
	// 아이디 찾기 폼
	@RequestMapping(value = "/find_id_form.do")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}
	
	
	// 닉네임 중복 검사(AJAX)
	@RequestMapping(value = "/check_nickname.do", method = RequestMethod.POST)
	public void check_nickname(@RequestParam("nickName") String nickname, HttpServletResponse response) throws Exception{
		service.check_nickname(nickname, response);
	}

	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		service.check_id(id, response);
	}
	
	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		service.check_email(email, response);
	}
	
	
	// 회원 가입 폼 이동
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.GET)
	public String memberJoinForm() throws Exception{
		return "/member/memberJoinForm";
	}
	
	// 회원 가입 처리
	@RequestMapping(value = "/join_member", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberDTO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", service.join_member(member, response));
		return "redirect:./login_form";
	}

	
	// 로그인 폼 이동
	@RequestMapping(value = "/login_form.do", method = RequestMethod.GET)
	public String login_form(@ModelAttribute("MemberDTO") MemberDTO member) throws Exception{
		return "/member/loginForm";
	}
	
	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member, HttpSession session, HttpServletResponse response) throws Exception{
		member =service.login(member, response);
		session.setAttribute("member", member);
		return "home";
	}
	
	
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{
		//session.invalidate();
		session.invalidate();
		service.logout(response);
		return "/member/logout";
	}
}
