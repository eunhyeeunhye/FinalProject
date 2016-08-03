package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.domain.MemberVO;
import com.babjo.prjfinal.domain.PaymentVO;
import com.babjo.prjfinal.domain.RentVO;

public interface MemberDAO {
	public MemberVO doLogin(String m_id, String m_pw) throws Exception;
	public void doSignup(MemberVO member);
	public String idCheck(String m_id);
	public void doUpdate(MemberVO member);
	public List<RentVO> useList(int m_code);
	public List<PaymentVO> payList(int m_code);
	public GroupVO myClub1(int m_code);
	public List<GroupVO> myClub2(int m_code);
	public int myMileage(int m_code);
	public String getWriter(int m_code);
}
