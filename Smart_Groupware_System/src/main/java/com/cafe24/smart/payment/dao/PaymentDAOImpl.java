package com.cafe24.smart.payment.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	private static final Logger log = LoggerFactory.getLogger(PaymentDAOImpl.class);
	
	SqlSession sqlSession;
}