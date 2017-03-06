package com.cafe24.smart.wbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.wbs.domain.Wbs;

@Repository
public class WbsDAOImpl implements WbsDAO {
	
	private static final Logger log = LoggerFactory.getLogger(WbsDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	//WBS 입력전 팀장정보 확인하기.
	@Override
	public Member selectByMmCodeMm(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("WbsDAO.selectByMmCodeMm", member);
	}

	//팀장코드로 프로젝트 조회하기
	@Override
	public List<Project> selectByMmCodePr(int mmCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("WbsDAO.selectByMmCodePr", mmCode);
	}

	//WBS 등록
	@Override
	public int insertWbs(Wbs wbs) {
		// TODO Auto-generated method stub
		return sqlSession.insert("WbsDAO.insertWbs", wbs);
	}
}