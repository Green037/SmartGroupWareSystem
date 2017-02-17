package com.cafe24.smart.commute.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommuteDAOImpl implements CommuteDAO {
	
	private static final Logger log = LoggerFactory.getLogger(CommuteDAO.class);
	
	SqlSession sqlSession;
}