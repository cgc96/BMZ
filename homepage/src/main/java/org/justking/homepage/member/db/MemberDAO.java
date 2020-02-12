package org.justking.homepage.member.db;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	private static final String NAMESPACE = "org.justking.homepage.sql.member";

	// 회원탈퇴
	@Transactional
	public int withdrawal(MemberDTO member) throws Exception{
		return sqlsession.delete(NAMESPACE + ".withdrawal", member);
	}

	// 마이페이지
	@Transactional
	public int update_mypage(MemberDTO member) throws Exception{
		return sqlsession.update(NAMESPACE + ".update_mypage", member);
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return sqlsession.update(NAMESPACE + ".update_pw", member);
	}
		
	// 아이디 중복 검사
	public int check_id(String id) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".check_id", id);
	}
	
	// 닉네임 중복 검사
	public int check_nickname(String nickname) {
		return sqlsession.selectOne(NAMESPACE + ".check_nickname", nickname);
	}
	
	// 이메일 중복 검사
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".check_email", email);
	}
	
	// 회원가입
	@Transactional
	public int join_member(MemberDTO member) throws Exception{
		return sqlsession.insert(NAMESPACE + ".join_member", member);
	}
	
	
	// 로그인 검사
	public MemberDTO login(String id) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".login", id);
	}
	
	// 로그인 접속일자 변경
	@Transactional
	public int update_log(String id) throws Exception{
		return sqlsession.update(NAMESPACE + ".update_log", id);
	}
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".find_id", email);
	}


}