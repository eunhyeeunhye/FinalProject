package com.babjo.prjfinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.RequestVO;
import com.babjo.prjfinal.persistence.RequestDAO;

@Service
public class RequestServiceImpl implements RequestService {
	@Autowired
	private RequestDAO dao;

	@Override
	public RequestVO readRequest(int r_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.readRequest(r_code);
	}

	@Override
	public List<RequestVO> requestList() throws Exception {
		// TODO Auto-generated method stub
		return dao.requestList();
	}

	@Override
	public void writeRequest(RequestVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeRequest(vo);
	}

	@Override
	public void writeAnswer(RequestVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeAnswer(vo);
	}

}
