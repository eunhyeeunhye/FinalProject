package com.babjo.prjfinal.domain;

public class NoticeVO {
	private int n_code;
	private String title;
	private String content;
	private String writer;
	private String regdate;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getN_code() {
		return n_code;
	}
	public String getRegdate() {
		return regdate;
	}
}
