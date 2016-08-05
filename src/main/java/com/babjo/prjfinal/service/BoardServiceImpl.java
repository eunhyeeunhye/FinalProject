/**
 1. 작성자 : 최은혜
 2. 작성일 : 2016.07.21
 3. 내용 : 게시판 기능 담당 서비스
 4. 수정내역 :    2016.07.29 cbard등 세세한 기능위한 추가 및 수정
 
 **/

package com.babjo.prjfinal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.BoardVO;
import com.babjo.prjfinal.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

   @Inject
   private BoardDAO dao;
   
   @Override
   public void write(BoardVO board) throws Exception {
      dao.write(board);

   }

   @Override
   public BoardVO read(Integer bno) throws Exception {
      return dao.read(bno);

   }
   
   @Override
   public String memname(int m_code) throws Exception {
      return dao.memname(m_code);
   }
   
   @Override
   public void modify(BoardVO board) throws Exception {
      dao.update(board);

   }

   @Override
   public void remove(Integer bno) throws Exception {
      dao.delete(bno);

   }

   @Override
   public List<BoardVO> list() throws Exception {
      return dao.list();
   }
   /*
   @Override
   public List<BoardVO> list2() throws Exception {

      return dao.list2();
   }
   */

   @Override
   public List<BoardVO> groupboard(int g_code, int b_code) throws Exception {
      return dao.groupboard(g_code, b_code);
   }

   @Override
   public List<BoardVO> cboard(int g_code, int b_code) throws Exception {
      
      return dao.cboard(g_code, b_code);
   }
   
}