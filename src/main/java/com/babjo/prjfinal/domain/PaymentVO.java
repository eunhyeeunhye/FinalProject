/*
 * 작성자 : 강인영
 * 작성일 : 2016.07.19
 * 내용 : 결제 관련 VO
 * 수정내역 : 
 */

package com.babjo.prjfinal.domain;

import java.util.Date;

public class PaymentVO {
	private int p_code;
	private int m_code;
	private Date p_date;
	private String p_means;
	private String p_period;
	private int p_money;
	private int usemileage;
	private int savemileage;
	
	
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
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public String getP_means() {
		return p_means;
	}
	public void setP_means(String p_means) {
		this.p_means = p_means;
	}
	public String getP_period() {
		return p_period;
	}
	public void setP_period(String p_period) {
		this.p_period = p_period;
	}
	public int getP_money() {
		return p_money;
	}
	public void setP_money(int p_money) {
		this.p_money = p_money;
	}
	public int getUsemileage() {
		return usemileage;
	}
	public void setUsemileage(int usemileage) {
		this.usemileage = usemileage;
	}
	public int getSavemileage() {
		return savemileage;
	}
	public void setSavemileage(int savemileage) {
		this.savemileage = savemileage;
	}
}
