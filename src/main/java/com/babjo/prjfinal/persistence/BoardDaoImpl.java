package com.babjo.prjfinal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.babjo.prjfinal.domain.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDAO {

	@Inject
	private SqlSession SqlSession;

	private static final String NAMESPACE = "com.rkskekabc.mappers.BoardMapper";

	@Override
	public void write(BoardVO vo) throws Exception {
		SqlSession.insert(NAMESPACE + ".write", vo);

	}

	@Override
	public BoardVO read(Integer bno) throws Exception {

		return SqlSession.selectOne(NAMESPACE + ".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		SqlSession.update(NAMESPACE + ".update", vo);

	}

	@Override
	public void delete(Integer bno) throws Exception {
		SqlSession.delete(NAMESPACE + ".delete", bno);

	}

	@Override
	public List<BoardVO> list() throws Exception {

		return SqlSession.selectList(NAMESPACE + ".list");
	}

	/*
	 * @Override public List<BoardVO> list2() throws Exception {
	 * 
	 * return SqlSession.selectList(NAMESPACE +".list2"); }
	 */
	@Override
	public List<BoardVO> groupboard(int g_code, int b_code) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("g_code", g_code);
		param.put("b_code", b_code);
		return SqlSession.selectList(NAMESPACE + ".groupboard", param);
	}

	@Override
	public List<BoardVO> cboard(int g_code, int b_code) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("gcode", g_code);
		paramMap.put("bcode", b_code);
		return SqlSession.selectList(NAMESPACE + ".cboard", paramMap);
	}
}