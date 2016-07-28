package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.NoticeVO;

public interface NoticeDAO {
	public NoticeVO readNotice(int n_code) throws Exception;
	public void writeNotice(NoticeVO vo) throws Exception;
	public void deleteNotice(int n_code) throws Exception;
	public List<NoticeVO> getNoticeList() throws Exception;
}
