package com.babjo.prjfinal.service;

import com.babjo.prjfinal.domain.MemberVO;

public interface MemberService {
	public MemberVO doLogin(String m_id, String m_pw) throws Exception;
	public void doSignup(MemberVO member);
	public String idCheck(String m_id);
	public void doUpdate(MemberVO member);
}
