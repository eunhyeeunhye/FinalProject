package com.babjo.prjfinal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.domain.RentVO;
import com.babjo.prjfinal.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;
	
	@Override
	public MemberVO doLogin(String m_id, String m_pw) throws Exception {
		return dao.doLogin(m_id, m_pw);
	}

	@Override
	public void doSignup(MemberVO member) {
		dao.doSignup(member);
	}

	@Override
	public String idCheck(String m_id) {
		return dao.idCheck(m_id);
	}

	@Override
	public void doUpdate(MemberVO member) {
		dao.doUpdate(member);
	}

	@Override
	public List<RentVO> useList(int m_code) {
		return dao.useList(m_code);
	}

	@Override
	public List<PaymentVO> payList(int m_code) {
		return dao.payList(m_code);
	}

	@Override
	public GroupVO myClub1(int m_code) {
		return dao.myClub1(m_code);
	}

	@Override
	public List<GroupVO> myClub2(int m_code) {
		return dao.myClub2(m_code);
	}

	@Override
	public int myMileage(int m_code) {
		return dao.myMileage(m_code);
	}

	@Override
	public String getWriter(int m_code) {
		return dao.getWriter(m_code);
	}

}
