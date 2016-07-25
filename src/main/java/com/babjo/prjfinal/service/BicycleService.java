package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;


public interface BicycleService {
	public List<BicycleVO> bicycleInfo(BicycleVO vo) throws Exception;
	public void rentinfo(RentVO vo) throws Exception;
	public void rentbicycle(int b_code);
	public void turnIn(Integer s_code) throws Exception;
	
}
