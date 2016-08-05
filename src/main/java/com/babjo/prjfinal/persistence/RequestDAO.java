/*
 * 작성자 : 김성주
 * 작성일 : 2016.07.19
 * 내용 : 고객센터(1:1문의) 관련 DAO
 * 수정내역 : 
 */

package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.RequestVO;

public interface RequestDAO {
	public RequestVO readRequest(int r_code) throws Exception;
	public List<RequestVO> requestList(int m_code) throws Exception;
	public List<RequestVO> adminRequestList() throws Exception;
	public void writeRequest(RequestVO vo) throws Exception;
	public void writeAnswer(RequestVO vo) throws Exception;
}
