package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.BoardVO;

public interface BoardDAO {
   public void write(BoardVO vo) throws Exception;
   
   public BoardVO read(Integer bno) throws Exception;
   
   public String memname(int m_code) throws Exception;
   
   public void update(BoardVO vo) throws Exception;
   
   public void delete(Integer bno) throws Exception;
   
   public List<BoardVO> list() throws Exception;
   
   //public List<BoardVO> list2() throws Exception;
   public List<BoardVO> groupboard(int g_code,int b_code) throws Exception;
   
   public List<BoardVO> cboard(int g_code, int b_code) throws Exception;
}