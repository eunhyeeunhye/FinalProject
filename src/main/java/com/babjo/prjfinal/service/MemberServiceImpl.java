package com.babjo.prjfinal.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.MemberVO;
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

}
