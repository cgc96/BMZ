package org.justking.homepage.member.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import org.apache.commons.mail.HtmlEmail;
import org.justking.homepage.member.db.MemberDAO;
import org.justking.homepage.member.db.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO manager;

	// 회원탈퇴
	@Override
	public boolean withdrawal(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(manager.withdrawal(member) != 1) {
			out.println("<script>");
			out.println("alert('회원탈퇴 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		}else {
			return true;
		}
	}
	
	// 회원정보 수정
	@Override
	public MemberDTO update_mypage(MemberDTO member) throws Exception {
		manager.update_mypage(member);
		return manager.login(member.getId());
	}
	
	// 비밀번호 변경
	@Override
	public MemberDTO update_pw(MemberDTO member, String old_pw, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!old_pw.equals(manager.login(member.getId()).getPw())) {
			out.println("<script>");
			out.println("alert('기존 비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			manager.update_pw(member);
			return manager.login(member.getId());
		}
	}
	/*
	// 비밀번호 찾기
	@Override
	public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(manager.check_id(member.getId()) == 0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!member.getEmail().equals(manager.login(member.getId()).getEmail())) {
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPw(pw);
			// 비밀번호 변경
			manager.update_pw(member);
			// 비밀번호 변경 메일 발송
			send_mail(member, "find_pw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}	*/
	
	@Override
	public String find_pw(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pw = manager.find_pw(email);
		
		if (pw == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return pw;
		}
	}
		
	
	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = manager.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
		
	// 로그아웃
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}
	
	// 이메일 발송
	@Override
	public void send_mail(MemberDTO member, String div) throws Exception {
		
	}
			
	// 아이디 중복 검사(AJAX)
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(manager.check_id(id));
		out.close();
	}
	
	// 닉네임 중복 검사(AJAX)
	@Override
	public void check_nickname(String nickname, HttpServletResponse response) throws Exception  {
		PrintWriter out = response.getWriter();
		out.println(manager.check_nickname(nickname));
		out.close();
		
	}

	// 이메일 중복 검사(AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(manager.check_email(email));
		out.close();
	}
	
	// 회원가입
	@Override
	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (manager.check_id(member.getId()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (manager.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (manager.check_nickname(member.getNickName()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 닉네임이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			manager.join_member(member);
			return 1;
		}
	}
	
	
	// 로그인
	@Override
	public MemberDTO login(MemberDTO member, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 등록된 아이디가 없으면
		if(manager.check_id(member.getId()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String pw = member.getPw();
			member = manager.login(member.getId());
			// 비밀번호가 다를 경우
			if(!member.getPw().equals(pw)) {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			// 로그인 일자 업데이트 및 회원정보 리턴		
			} else {
				manager.update_log(member.getId());
				return member;
			}
		}
	}
		
	
}