/**
 1. 작성자 : 최은혜
 2. 작성일 : 2016.07.22
 3. 내용 : 동아리 기능 담당 서비스
 4. 수정내역 :    2016.07.30 gname등의 기능 추가 및 수정 
 **/

package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.GroupVO;

public interface GroupService {
   public void estab(GroupVO board) throws Exception;
   
   public GroupVO ginfo(int m_code) throws Exception;
   
   public GroupVO binfo(int g_code) throws Exception;
   
   public void regist(int g_code, int m_code) throws Exception;
   
   //public void join(GroupVO vo) throws Exception;
   
   public List<GroupVO> memcheck(int g_code) throws Exception;
   
   public void make(GroupVO board) throws Exception;
   
   public List<GroupVO> infogroup() throws Exception;
   
   public List<GroupVO> gboard(int g_code) throws Exception;
   
   public String gname(int g_code) throws Exception;
}