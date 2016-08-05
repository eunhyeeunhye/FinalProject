/*
 * 작성자 : 강인영
 * 작성일 : 2016.07.19
 * 내용 : 결제 관련 Service
 * 수정내역 : 2016.08.04 myMileage 추가
 */

package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;


public interface PaymentService {
	public void pay(PaymentVO vo) throws Exception;
	public void update(MemberVO vo) throws Exception;
	public void useMileage(MemberVO vo) throws Exception;
	public List<PaymentVO> readPayInfo() throws Exception;
	public int myMileage(int m_code);
}
