package com.babjo.prjfinal.domain;

import java.sql.Date;

public class GroupVO {
	private int g_code;
	private int m_code;
	private String name;
	private String purpose;
	private Date regdate;
	private int b_code;
	private String b_name;
	
	public int getG_code() {
		return g_code;
	}
	public void setG_code(int g_code) {
		this.g_code = g_code;
	}
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}	
	
	
	
	
	
	
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String toString(){
		return "GroupVO [g_code ="+g_code+", m_code" +m_code+", name" +name+
				", purpose" + purpose + ", regdate" +regdate +", b_code"+b_code +"b_name" +b_name +"]";
	}
}
