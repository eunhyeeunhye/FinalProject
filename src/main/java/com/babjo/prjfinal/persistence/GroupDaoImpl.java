package com.babjo.prjfinal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.GroupVO;

@Repository
public class GroupDaoImpl implements GroupDAO{

   @Inject
   private SqlSession SqlSession;
   
   private static final String NAMESPACE = "com.rkskekabc.mappers.GroupMapper";
   
   @Override
   public void estab(GroupVO vo) throws Exception {
      SqlSession.insert(NAMESPACE + ".estab", vo);
      
   }
   
   @Override
   public GroupVO ginfo(int m_code) throws Exception {
      return SqlSession.selectOne(NAMESPACE+ ".ginfo", m_code);
   }

   @Override
   public GroupVO binfo(int g_code) throws Exception {
      return SqlSession.selectOne(NAMESPACE +".binfo", g_code);
   }

   
   @Override
   public void make(GroupVO vo) throws Exception {
      SqlSession.insert(NAMESPACE + ".makeboard", vo);
      
   }

   
   @Override
   public void regist(int g_code, int m_code) throws Exception {
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("g_code", g_code);
      param.put("m_code", m_code);
      SqlSession.insert(NAMESPACE + ".regist", param);
   }
   
      
   @Override
   public List<GroupVO> memcheck(int g_code) throws Exception {
      return SqlSession.selectList(NAMESPACE + ".memcheck", g_code);
   }
   @Override
   public List<GroupVO> infogroup() throws Exception {
      return SqlSession.selectList(NAMESPACE + ".infogroup");
   }


   @Override
   public List<GroupVO> gboard(int g_code) throws Exception {
      
      return SqlSession.selectList(NAMESPACE + ".gboard", g_code);
   }

}