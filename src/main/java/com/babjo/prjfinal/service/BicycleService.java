/*
 * 작성자 : 김정훈
 * 작성일 : 2016.07.24
 * 내용 : 자전거 대여/반납관련 Service
 * 수정내역 : 
 */
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
