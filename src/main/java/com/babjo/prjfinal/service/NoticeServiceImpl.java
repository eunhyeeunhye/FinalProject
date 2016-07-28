package com.babjo.prjfinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.babjo.prjfinal.domain.NoticeVO;
import com.babjo.prjfinal.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO dao;

	@Override
	public NoticeVO readNotice(int n_code) throws Exception {
		return dao.readNotice(n_code);
	}

	@Override
	public void writeNotice(NoticeVO vo) throws Exception {
		dao.writeNotice(vo);
	}

	@Override
	public void deleteNotice(int n_code) throws Exception {
		dao.deleteNotice(n_code);
	}

	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		return dao.getNoticeList();
	}

}
