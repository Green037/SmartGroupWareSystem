package com.cafe24.smart.extraSchedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.member.domain.Member;

@Repository
public class ExtraScheduleDAOImpl implements ExtraScheduleDAO {

	private static final Logger log = LoggerFactory.getLogger(ExtraScheduleDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	// 근외 조회
	@Override
	public List<ExtraSchedule> selectPersonalEs(ExtraSchedule extraSchedule) {

		log.debug("ExtraScheduleDAOImpl selectPersonalEs extraSchedule : " + extraSchedule);

		return sqlSession.selectList("EsDAO.selectPersonalEs", extraSchedule);
	}

	// 부서 해당 직원 조회
	@Override
	public List<Member> selectByDpCodeMm(int dpCode) {

		log.debug("ExtraScheduleDAOImpl selectByDpCodeMm dpCode : " + dpCode);

		return sqlSession.selectList("EsDAO.selectByDpCodeMm", dpCode);
	}

	// 부서별 근외조회
	@Override
	public List<ExtraSchedule> selectDpEs(Map<String, Object> paramMap) {

		log.debug("ExtraScheduleDAOImpl selectDpEs paramMap : " + paramMap);

		return sqlSession.selectList("EsDAO.selectByDpEs", paramMap);
	}

	@Override
	public ExtraSchedule selectEs(int esCode) {

		log.debug("ExtraScheduleDAOImpl selectEs esCode : " + esCode);

		return sqlSession.selectOne("EsDAO.selectEs", esCode);
	}

	// 연차 신청
	@Override
	public int insertVa(ExtraSchedule extraSchedule) {

		log.debug("ExtraScheduleDAOImpl insertVa extraSchedule : " + extraSchedule);

		return sqlSession.insert("EsDAO.insertVa", extraSchedule);
	}

	// 출장 신청
	@Override
	public int insertWo(ExtraSchedule extraSchedule) {

		log.debug("ExtraScheduleDAOImpl insertWo extraSchedule : " + extraSchedule);

		return sqlSession.insert("EsDAO.insertWo", extraSchedule);
	}
}