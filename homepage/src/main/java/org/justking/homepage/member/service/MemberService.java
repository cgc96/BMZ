package org.justking.homepage.member.service;

import javax.servlet.http.HttpServletResponse;
import org.justking.homepage.member.db.MemberDTO;

public interface MemberService {
	
	public void check_nickname(String nickname, HttpServletResponse response) throws Exception;

	public void check_id(String id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception;

	MemberDTO login(MemberDTO member, HttpServletResponse response) throws Exception;

	void logout(HttpServletResponse response) throws Exception;

	String find_id(HttpServletResponse response, String email) throws Exception;

	void send_mail(MemberDTO member, String div) throws Exception;

	void find_pw(HttpServletResponse response, MemberDTO member) throws Exception;

	MemberDTO update_mypage(MemberDTO member) throws Exception;

	MemberDTO update_pw(MemberDTO member, String old_pw, HttpServletResponse response) throws Exception;

	boolean withdrawal(MemberDTO member, HttpServletResponse response) throws Exception;
}