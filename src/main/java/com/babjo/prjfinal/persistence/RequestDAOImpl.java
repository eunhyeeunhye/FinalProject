/*
 * 작성자 : 김성주
 * 작성일 : 2016.07.19
 * 내용 : 고객센터(1:1문의) 관련 DAO
 * 수정내역 : 
 */

package com.babjo.prjfinal.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.RequestVO;

@Repository
public class RequestDAOImpl implements RequestDAO {
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.rkskekabc.mappers.RequestMapper";
	
	@Override
	public RequestVO readRequest(int r_code) throws Exception {
		return session.selectOne(namespace + ".readRequest", r_code);
	}

	@Override
	public List<RequestVO> requestList(int m_code) throws Exception {
		return session.selectList(namespace + ".requestList", m_code);
	}

	@Override
	public List<RequestVO> adminRequestList() throws Exception {
		return session.selectList(namespace + ".adminRequestList");
	}

	@Override
	public void writeRequest(RequestVO vo) throws Exception {
		session.insert(namespace + ".writeRequest", vo);
	}

	@Override
	public void writeAnswer(RequestVO vo) throws Exception {
		session.update(namespace + ".writeAnswer", vo);
	}

}
