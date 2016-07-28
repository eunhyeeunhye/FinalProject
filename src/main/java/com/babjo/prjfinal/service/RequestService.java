package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.RequestVO;

public interface RequestService {
	public RequestVO readRequest(int r_code) throws Exception;
	public List<RequestVO> requestList() throws Exception;
	public void writeRequest(RequestVO vo) throws Exception;
	public void writeAnswer(RequestVO vo) throws Exception;
}
