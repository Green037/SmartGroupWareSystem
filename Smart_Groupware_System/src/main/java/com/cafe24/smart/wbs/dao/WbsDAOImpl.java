package com.cafe24.smart.wbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WbsDAOImpl implements WbsDAO {
	
	private static final Logger log = LoggerFactory.getLogger(WbsDAOImpl.class);
	
	SqlSession sqlSession;
}