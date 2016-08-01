package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;

public interface PaymentDAO {
	public void pay(PaymentVO vo) throws Exception;
	public void update(MemberVO vo) throws Exception;
	public void useMileage(MemberVO vo) throws Exception;
	public List<PaymentVO> readPayInfo() throws Exception;
}
