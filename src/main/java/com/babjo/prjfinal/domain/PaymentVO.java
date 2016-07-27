package com.babjo.prjfinal.domain;

import java.util.Date;

public class PaymentVO {
   private int p_code;
   private int m_code;
   private Date payment_date;
   private int amount;
   private String payment_means;
   
   
   public int getP_code() {
      return p_code;
   }
   public void setP_code(int p_code) {
      this.p_code = p_code;
   }
   public int getM_code() {
      return m_code;
   }
   public void setM_code(int m_code) {
      this.m_code = m_code;
   }
   public Date getPayment_date() {
      return payment_date;
   }
   public void setPayment_date(Date payment_date) {
      this.payment_date = payment_date;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
   }
   public String getPayment_means() {
      return payment_means;
   }
   public void setPayment_means(String payment_means) {
      this.payment_means = payment_means;
   }
   

}