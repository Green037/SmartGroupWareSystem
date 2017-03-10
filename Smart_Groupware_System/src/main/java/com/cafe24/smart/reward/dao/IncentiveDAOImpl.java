package com.cafe24.smart.reward.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.reward.domain.Incentive;

@Repository
public class IncentiveDAOImpl implements IncentiveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertIn(Incentive incentive) {
		
		int n = 0;
		
		System.out.println("IncentiveDAOImpl insertIn incentive : " + incentive);
		
		n = sqlSession.insert("PaDAO.insertIn", incentive);
		
		System.out.println("IncentiveDAOImpl insertIn n : " + n);
		
		return n;
	}

}