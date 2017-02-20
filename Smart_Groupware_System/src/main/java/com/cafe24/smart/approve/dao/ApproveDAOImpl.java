package com.cafe24.smart.approve.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ApproveDAOImpl implements ApproveDAO {
	
	private static final Logger log = LoggerFactory.getLogger(ApproveDAOImpl.class);
	
	SqlSession sqlSession;
}