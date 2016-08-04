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
   public GroupVO ginfo(int m_code) throws Exception {
      return dao.ginfo(m_code);
      
   }
   
   @Override
   public GroupVO binfo(int g_code) throws Exception {
      return dao.binfo(g_code);
   }


   @Override
   public void make(GroupVO board) throws Exception {
      dao.make(board);
      
   }
   
   @Override
   public void regist(int g_code, int m_code) throws Exception {
      dao.regist(g_code, m_code);
      
   }
   /*
   @Override
   public void join(GroupVO vo) throws Exception {
      dao.join(vo);
   }
   */
   
   @Override
   public List<GroupVO> memcheck(int g_code) throws Exception {
      // TODO Auto-generated method stub
      return dao.memcheck(g_code);
   }
   @Override
   public List<GroupVO> infogroup() throws Exception {
      return dao.infogroup();
   }


   @Override
   public List<GroupVO> gboard(int g_code) throws Exception {
      
      return dao.gboard(g_code);
   }

	@Override
	public String gname(int g_code) throws Exception {
		return dao.gname(g_code);
	}

}