package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;


public interface BicycleService {
	public List<BicycleVO> bicycleInfo(BicycleVO vo) throws Exception;
	public void rentinfo(RentVO vo) throws Exception;
	public void rentbicycle(int b_code);
	public List<RentVO> renting(RentVO vo) throws Exception;
	public void turnin(Integer m_code) throws Exception;
	public void turninbicycle(Integer b_code) throws Exception;
	
}
