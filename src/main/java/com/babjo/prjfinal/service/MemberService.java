package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.RentVO;
import com.babjo.prjfinal.domain.PaymentVO;

public interface MemberService {
	public MemberVO doLogin(String m_id, String m_pw) throws Exception;
	public void doSignup(MemberVO member);
	public String idCheck(String m_id);
	public void doUpdate(MemberVO member);
	public List<RentVO> useList(int m_code);
	public List<PaymentVO> payList(int m_code);
	public GroupVO myClub1(int m_code);
	public List<GroupVO> myClub2(int m_code);
}
