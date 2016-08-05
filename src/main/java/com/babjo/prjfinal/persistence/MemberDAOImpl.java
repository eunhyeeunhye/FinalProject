/*
 * 작성자 : 이현호
 * 작성일 : 2016.07.19
 * 내용 : 멤버 관련 DAO
 * 수정내역 : 2016.08.01 myClub1, myClub2 추가
 * 		2016.08.02 myMileage 추가
 * 		2016.08.03 getWriter 추가
 */

package com.babjo.prjfinal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.domain.RentVO;

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

	@Override
	public List<RentVO> useList(int m_code) {
		return sqlSession.selectList(NAMESPACE + ".useList", m_code);
	}

	@Override
	public List<PaymentVO> payList(int m_code) {
		return sqlSession.selectList(NAMESPACE + ".payList", m_code);
	}

	@Override
	public GroupVO myClub1(int m_code) {
		return sqlSession.selectOne(NAMESPACE + ".myClub1", m_code);
	}

	@Override
	public List<GroupVO> myClub2(int m_code) {
		return sqlSession.selectList(NAMESPACE + ".myClub2", m_code);
	}

	@Override
	public int myMileage(int m_code) {
		return sqlSession.selectOne(NAMESPACE + ".myMileage", m_code);
	}

	@Override
	public String getWriter(int m_code) {
		return sqlSession.selectOne(NAMESPACE + ".getWriter", m_code);
	}
		
}
