package com.babjo.prjfinal.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.babjo.mappers.memberMapper";
	
	@Override
	public MemberVO doLogin(String m_id, String m_pw) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("m_id", m_id);
		paramMap.put("m_pw", m_pw);
		MemberVO member = sqlSession.selectOne(NAMESPACE + ".doLogin", paramMap);
		
		return member;
	}

	@Override
	public void doSignup(MemberVO member) {
		sqlSession.insert(NAMESPACE + ".doSignup", member);
	}

	@Override
	public String idCheck(String m_id) {
		return sqlSession.selectOne(NAMESPACE + ".idCheck", m_id);
	}

	@Override
	public void doUpdate(MemberVO member) {
		sqlSession.update(NAMESPACE + ".doUpdate", member);
	}
	
}
