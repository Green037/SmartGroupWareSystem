package com.cafe24.smart.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.payment.domain.PayContent;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	private static final Logger log = LoggerFactory.getLogger(PaymentDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<PayContent> selectAllPa() {
		List<PayContent> payList = null;
		
//		payList = sqlSession.selectList(statement);
		
		return null;
	}
	
	@Override
	public int selectByPc(int mmCode, String reDate) {
		
		System.out.println("PaymentDAOImpl selectByPc mmCode : " + mmCode);
		System.out.println("PaymentDAOImpl selectByPc reDate : " + reDate);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("reDate", reDate);
		
		return sqlSession.selectOne("PcDAO.selectByPc", params);
	}
	
	@Override
	public int insertPc(PayContent payContent) {
		
		System.out.println("PaymentDAOImpl insertPc payContent : " + payContent);
		
		return sqlSession.insert("PcDAO.insertPc", payContent);
	}

}