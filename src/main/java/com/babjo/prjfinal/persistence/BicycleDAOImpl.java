/*
 * 작성자 : 김정훈
 * 작성일 : 2016.07.24
 * 내용 : 자전거 대여/반납관련 DAO
 * 수정내역 : 
 */
package com.babjo.prjfinal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;


@Repository
public class BicycleDAOImpl implements BicycleDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.babjo.prjfinal.bicycleMapper";
	

	@Override
	public List<BicycleVO> bicycleInfo(Integer s_code) {
		//System.out.println(s_code);
		return sqlSession.selectList(NAMESPACE + ".stationinfo", s_code);
	}

	@Override
	public void rentinfo(RentVO vo) {
		sqlSession.insert(NAMESPACE + ".rentinfo", vo);
	}

	@Override
	public void rentbicycle(int b_code) {
		sqlSession.update(NAMESPACE + ".rentbicycle", b_code);
		
	}

	@Override
	public List<RentVO> renting(Integer m_code) {
		//System.out.println(m_code);
		return sqlSession.selectList(NAMESPACE + ".renting", m_code);
	}

	@Override
	public void turnin(Integer m_code) {
		//System.out.println(m_code);
		sqlSession.update(NAMESPACE + ".turnin", m_code);
	}

	@Override
	public void turninbicycle(Integer b_code) {
		//System.out.println(b_code);
		sqlSession.update(NAMESPACE + ".turninbicycle", b_code);
	}

	@Override
	public List<BicycleVO> bInfo(Integer s_code) {
		return sqlSession.selectList(NAMESPACE + ".bicycleinfo", s_code);
	}

}
