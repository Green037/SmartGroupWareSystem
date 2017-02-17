package com.cafe24.smart.reward.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class RewardDAOImpl implements RewardDAO {

	private static final Logger log = LoggerFactory.getLogger(RewardDAOImpl.class);
	
	SqlSession sqlSession;
}