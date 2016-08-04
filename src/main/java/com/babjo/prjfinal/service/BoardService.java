package com.babjo.prjfinal.service;

import java.util.List;

import com.babjo.prjfinal.domain.BoardVO;

public interface BoardService {
   
   public void write(BoardVO board) throws Exception;
   
   public BoardVO read(Integer bno) throws Exception;
   
   public String memname(int m_code) throws Exception;
   
   public void modify(BoardVO board) throws Exception;
   
   public void remove(Integer bno) throws Exception;
   
   public List<BoardVO> list() throws Exception;
   
   public List<BoardVO> groupboard(int g_code, int b_code) throws Exception;
   
   public List<BoardVO> cboard (int g_code, int b_code) throws Exception;
   //public List<BoardVO> list2() throws Exception;
   
}