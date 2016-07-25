package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;


public interface BicycleDAO {
	
	public List<BicycleVO> bicycleInfo(Integer s_code);
	public void rentinfo(RentVO vo);
	public void rentbicycle(int b_code);
	public void turnIn(Integer s_code);
}
