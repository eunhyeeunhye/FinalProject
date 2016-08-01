package com.babjo.prjfinal.domain;

import java.util.Date;

public class PaymentVO {
	private int p_code;
	private int m_code;
	private Date p_date;
	private String p_means;
	private String usedate;
	private int money;
	private int usemileage;
	private int mileage;
	
	
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
	public String getUsedate() {
		return usedate;
	}
	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	public int getUsemileage() {
		return usemileage;
	}
	public void setUsemileage(int usemileage) {
		this.usemileage = usemileage;
	}
	
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
}
