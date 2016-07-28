package com.babjo.prjfinal.domain;

public class PagingVO {
	private int page;
	private int numPerPage;
	private int pagePerBlock;
	private int totalNum;
	private int totalPage;
	private int totalBlock;
	private int nowBlock;
	private int startPerPage;
	private int startPagePerBlock;
	
	public PagingVO(){}
	public PagingVO(int totalNum, int page){
		if(page <= 0){
			this.page = 1;
		}
		else{
			this.page = page;
		}
		this.numPerPage = 10;
		this.pagePerBlock = 3;
		this.totalNum = totalNum;
		this.totalPage = (int)Math.ceil((this.totalNum)/((double)this.numPerPage));
		this.totalBlock = (int)Math.ceil((this.totalPage)/((double)this.pagePerBlock));
		this.nowBlock = (int)Math.ceil((this.page)/((double)this.pagePerBlock));
		this.startPerPage = this.numPerPage * (this.page-1) + 1;
		this.startPagePerBlock = (this.nowBlock * this.pagePerBlock) - this.pagePerBlock + 1;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getStartPerPage() {
		return startPerPage;
	}
	public void setStartPerPage(int startPerPage) {
		this.startPerPage = startPerPage;
	}
	public int getStartPagePerBlock() {
		return startPagePerBlock;
	}
	public void setStartPagePerBlock(int startPagePerBlock) {
		this.startPagePerBlock = startPagePerBlock;
	}
}
