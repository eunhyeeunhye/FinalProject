/*
 * 작성자 : 김성주
 * 작성일 : 2016.07.19
 * 내용 : 고객센터(공지사항) 관련 DAO
 * 수정내역 : 
 */

package com.babjo.prjfinal.persistence;

import java.util.List;

import com.babjo.prjfinal.domain.NoticeVO;

public interface NoticeDAO {
	public NoticeVO readNotice(int n_code) throws Exception;
	public void writeNotice(NoticeVO vo) throws Exception;
	public void deleteNotice(int n_code) throws Exception;
	public List<NoticeVO> getNoticeList() throws Exception;
}
