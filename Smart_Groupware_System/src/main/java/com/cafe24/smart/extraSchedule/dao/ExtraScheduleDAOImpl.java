package com.cafe24.smart.extraSchedule.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExtraScheduleDAOImpl implements ExtraScheduleDAO {
	
	private static final Logger log = LoggerFactory.getLogger(ExtraScheduleDAOImpl.class);
	
	SqlSession sqlSession;
}