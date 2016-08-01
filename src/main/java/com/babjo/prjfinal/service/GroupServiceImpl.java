package com.babjo.prjfinal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.GroupVO;
import com.babjo.prjfinal.persistence.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService{

	@Inject
	private GroupDAO dao;
	@Override
	public void estab(GroupVO vo) throws Exception {
		dao.estab(vo);
		
	}


	@Override
	public void make(GroupVO board) throws Exception {
		dao.make(board);
		
	}

	@Override
	public void regist(GroupVO vo) throws Exception {
		dao.join(vo);
	}


	@Override
	public List<GroupVO> infogroup() throws Exception {
		return dao.infogroup();
	}


	@Override
	public List<GroupVO> gboard(int g_code) throws Exception {
		
		return dao.gboard(g_code);
	}

}
