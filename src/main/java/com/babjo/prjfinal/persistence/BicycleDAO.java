/*
 * 작성자 : 김정훈
 * 작성일 : 2016.07.24
 * 내용 : 자전거 대여/반납관련 DAO
 * 수정내역 : 
 */
package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.BicycleVO;
import com.babjo.prjfinal.domain.RentVO;


public interface BicycleDAO {
	
	public List<BicycleVO> bicycleInfo(Integer s_code);
	public void rentinfo(RentVO vo);
	public void rentbicycle(int b_code);
	public List<RentVO> renting(Integer m_code);
	public void turnin(Integer m_code);
	public void turninbicycle(Integer b_code);
}
