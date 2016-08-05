/*
 * 작성자 : 김성주
 * 작성일 : 2016.07.19
 * 내용 : 고객센터(공지사항) 관련 VO
 * 수정내역 : 
 */

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
