/**
 1. 작성자 : 최은혜
 2. 작성일 : 2016.07.21
 3. 내용 : 동아리 기능 담당 dao
 4. 수정내역 :    2016.07.29
 **/

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