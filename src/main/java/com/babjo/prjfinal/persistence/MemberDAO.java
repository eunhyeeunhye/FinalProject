/*
 * 작성자 : 이현호
 * 작성일 : 2016.07.19
 * 내용 : 멤버 관련 DAO
 * 수정내역 : 2016.08.01 myClub1, myClub2 추가
 * 		2016.08.02 myMileage 추가
 * 		2016.08.03 getWriter 추가
 */

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
