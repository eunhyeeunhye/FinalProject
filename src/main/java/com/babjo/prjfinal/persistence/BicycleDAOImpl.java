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
	public void turnIn(Integer s_code) {
		// TODO Auto-generated method stub

	}

}
