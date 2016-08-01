package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.GroupVO;

public interface GroupService {
	public void estab(GroupVO board) throws Exception;
	
	public void regist(GroupVO vo) throws Exception;
	
	public void make(GroupVO board) throws Exception;
	
	public List<GroupVO> infogroup() throws Exception;
	
	public List<GroupVO> gboard(int g_code) throws Exception;
}
