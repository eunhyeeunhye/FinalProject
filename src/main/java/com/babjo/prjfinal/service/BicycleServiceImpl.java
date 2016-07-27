package com.babjo.prjfinal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;
import com.babjo.prjfinal.persistence.BicycleDAO;


@Service
public class BicycleServiceImpl implements BicycleService {
	
	@Inject
	private BicycleDAO dao;

	@Override
	public List<BicycleVO> bicycleInfo(BicycleVO vo) throws Exception {
		//System.out.println(vo.getS_code());
		//dao.bicycleInfo(vo.getS_code());
		
		return dao.bicycleInfo(vo.getS_code());
	}

	@Override
	public void rentinfo(RentVO vo) throws Exception {
		dao.rentinfo(vo);
	}

	@Override
	public void rentbicycle(int b_code) {
		dao.rentbicycle(b_code);
	}
	
	@Override
	public List<RentVO> renting(RentVO vo) throws Exception {
		//System.out.println(vo.getM_code());
		dao.renting(vo.getM_code());
		
		return dao.renting(vo.getM_code());
	}

	@Override
	public void turnin(Integer m_code) throws Exception {
		//System.out.println("m_code : " + m_code);
		dao.turnin(m_code);
	}

	@Override
	public void turninbicycle(Integer b_code) throws Exception {
		//System.out.println("b_code : " + b_code);
		dao.turninbicycle(b_code);
	}
	

}
