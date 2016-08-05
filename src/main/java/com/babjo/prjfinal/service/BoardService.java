/**
 1. 작성자 : 최은혜
 2. 작성일 : 2016.07.21
 3. 내용 : 게시판 기능 담당 서비스
 4. 수정내역 :    2016.07.29 cbard등 세세한 기능위한 추가 및 수정
 
 **/

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