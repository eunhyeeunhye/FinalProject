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
