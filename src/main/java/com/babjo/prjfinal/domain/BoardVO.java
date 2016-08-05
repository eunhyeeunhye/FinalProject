/**
 1. 작성자 : 최은혜
 2. 작성일 : 2016.07.21
 3. 내용 : 게시판 기능 담당 VO
 4. 수정내역 :    2016.07.29 cbard등 세세한 기능위한 추가 및 수정
 
 **/
package com.babjo.prjfinal.domain;

import java.sql.Date;

public class BoardVO {
   
   private int bno;
   private int g_code;
   private int b_code;
   private int m_code;
   private String title;
   private String content;
   
   private Date regdate;
   private int viewcnt;
   
   public int getBno() {
      return bno;
   }
   public void setBno(int bno) {
      this.bno = bno;
   }
   
   public int getG_code() {
      return g_code;
   }
   public void setG_code(int g_code) {
      this.g_code = g_code;
   }
   public int getB_code() {
      return b_code;
   }
   public void setB_code(int b_code) {
      this.b_code = b_code;
   }
   public int getM_code() {
      return m_code;
   }
   public void setM_code(int m_code) {
      this.m_code = m_code;
   }  
   
   
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   
   
   
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public int getViewcnt() {
      return viewcnt;
   }
   public void setViewcnt(int viewcnt) {
      this.viewcnt = viewcnt;
   }
   @Override
   public String toString() {
      return "BoardVO [bno=" + bno + ", title=" + title + ", g_code"+g_code+ ", b_code"+b_code+
            ", m_code"+ m_code+", content=" + content +  ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
   }

}