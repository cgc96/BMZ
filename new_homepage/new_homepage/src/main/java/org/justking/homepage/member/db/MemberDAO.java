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

	@Transactional
	public int withdrawal(MemberDTO member) throws Exception{
		return sqlsession.delete(NAMESPACE + ".withdrawal", member);
	}

	@Transactional
	public int update_mypage(MemberDTO member) throws Exception{
		return sqlsession.update(NAMESPACE + ".update_mypage", member);
	}
	
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return sqlsession.update(NAMESPACE + ".update_pw", member);
	}
		
	public int check_id(String id) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".check_id", id);
	}
	
	public int check_nickname(String nickname) {
		return sqlsession.selectOne(NAMESPACE + ".check_nickname", nickname);
	}
	
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".check_email", email);
	}
	
	@Transactional
	public int join_member(MemberDTO member) throws Exception{
		return sqlsession.insert(NAMESPACE + ".join_member", member);
	}
	
	public MemberDTO login(String id) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".login", id);
	}
	
	@Transactional
	public int update_log(String id) throws Exception{
		return sqlsession.update(NAMESPACE + ".update_log", id);
	}
	
	public String find_id(String email) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".find_id", email);
	}

	public String find_pw(String email) throws Exception{
		return sqlsession.selectOne(NAMESPACE + ".find_pw", email);
	}

}