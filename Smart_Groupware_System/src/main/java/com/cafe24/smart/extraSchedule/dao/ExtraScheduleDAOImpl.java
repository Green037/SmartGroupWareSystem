package com.cafe24.smart.extraSchedule.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;

@Repository
public class ExtraScheduleDAOImpl implements ExtraScheduleDAO {
	
	private static final Logger log = LoggerFactory.getLogger(ExtraScheduleDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	//연차 신청
	@Override
	public int insertVa(ExtraSchedule extraSchedule) {
		// TODO Auto-generated method stub
		System.out.println("쿼리전 최종 값 확인 : "+extraSchedule);
		return sqlSession.insert("EsDAO.insertVa", extraSchedule);
	}
}