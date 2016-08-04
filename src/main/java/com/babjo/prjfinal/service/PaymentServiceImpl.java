package com.babjo.prjfinal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.persistence.PaymentDAO;




@Service
public class PaymentServiceImpl implements PaymentService {

	@Inject
	private PaymentDAO dao;
	
	
	@Override
	public void pay(PaymentVO vo) throws Exception {
		dao.pay(vo);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}
	
	@Override
	public void useMileage(MemberVO vo) throws Exception {
		dao.useMileage(vo);
	}
	
	@Override
	public List<PaymentVO> readPayInfo() throws Exception {
		return dao.readPayInfo();
	}
	
	@Override
	public int myMileage(int m_code) {
		return dao.myMileage(m_code);
	}

}
