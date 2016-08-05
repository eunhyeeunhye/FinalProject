/*
 * 작성자 : 김성주
 * 작성일 : 2016.07.19
 * 내용 : 고객센터(공지사항) 관련 DAO
 * 수정내역 : 
 */

package com.babjo.prjfinal.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.rkskekabc.mappers.NoticeMapper";

	@Override
	public NoticeVO readNotice(int n_code) throws Exception {
		return session.selectOne(namespace + ".readNotice", n_code);
	}

	@Override
	public void writeNotice(NoticeVO vo) throws Exception {
		session.insert(namespace + ".writeNotice", vo);
	}

	@Override
	public void deleteNotice(int n_code) throws Exception {
		session.delete(namespace + ".deleteNotice", n_code);
	}

	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		return session.selectList(namespace + ".getNoticeList");
	}
}
