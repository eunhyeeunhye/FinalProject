/*
 * 작성자 : 강인영
 * 작성일 : 2016.07.19
 * 내용 : 결제 관련 DAO
 * 수정내역 : 2016.08.04 myMileage 추가
 */

package com.babjo.prjfinal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.babjo.mappers.PaymentMapper";
	
	@Override
	public void pay(PaymentVO vo) throws Exception {
		sqlSession.selectOne(NAMESPACE + ".pay", vo);
	}
	
	@Override
	public void update(MemberVO vo) throws Exception {
		sqlSession.selectOne(NAMESPACE + ".update", vo);
	}
	
	@Override
	public void useMileage(MemberVO vo) throws Exception {
		sqlSession.selectOne(NAMESPACE + "useMileage", vo);
		
	}
	@Override
	public List<PaymentVO> readPayInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".readPayInfo");
	}
	
	@Override
	public int myMileage(int m_code) {
		return sqlSession.selectOne(NAMESPACE + ".myMileage", m_code);
	}
	
}
