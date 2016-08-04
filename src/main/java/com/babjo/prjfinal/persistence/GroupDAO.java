package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.GroupVO;

public interface GroupDAO {
   public void estab(GroupVO vo) throws Exception;
   
   public GroupVO ginfo(int m_code) throws Exception;
   
   public GroupVO binfo(int g_code) throws Exception;
   
   public void make(GroupVO vo) throws Exception;

   public void regist(int g_code, int m_code) throws Exception;
   //public void join(GroupVO vo) throws Exception;
   
   public List<GroupVO> memcheck(int g_code) throws Exception;
   
   public List<GroupVO> infogroup() throws Exception;
   
   public List<GroupVO> gboard (int g_code) throws Exception;
   
   public String gname(int g_code) throws Exception;
}