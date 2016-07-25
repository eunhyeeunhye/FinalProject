package com.babjo.prjfinal.domain;

public class BicycleVO {
	private int b_code;
	private int s_code;
	private String s_location;
	private String s_sub_location;
	private int b_state;
	
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public int getS_code() {
		return s_code;
	}
	public void setS_code(int s_code) {
		this.s_code = s_code;
	}
	public String getS_location() {
		return s_location;
	}
	public void setS_location(String s_location) {
		this.s_location = s_location;
	}
	public String getS_sub_location() {
		return s_sub_location;
	}
	public void setS_sub_location(String s_sub_location) {
		this.s_sub_location = s_sub_location;
	}
	public int getB_state() {
		return b_state;
	}
	public void setB_state(int b_state) {
		this.b_state = b_state;
	}
}
