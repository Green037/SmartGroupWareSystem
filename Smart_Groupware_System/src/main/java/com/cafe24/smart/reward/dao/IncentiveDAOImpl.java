package com.cafe24.smart.reward.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.reward.domain.Incentive;

@Repository
public class IncentiveDAOImpl implements IncentiveDAO {
	
	private static final Logger log = LoggerFactory.getLogger(IncentiveDAOImpl.class);

	@Autowired
	SqlSessionTemplate sqlSession;
	
//	특정 고과 번호의 성과금 보기
	@Override
	public Incentive selectIn(int reCode) {
		
		log.debug("IncentiveDAOImpl selectIn reCode : " + reCode);
		
		return sqlSession.selectOne("ReDAO.selectIn", reCode);
	}
	
//	성과금 추가
	@Override
	public int insertIn(Incentive incentive) {
		
		int n = 0;
		
		log.debug("IncentiveDAOImpl insertIn incentive : " + incentive);
		
		n = sqlSession.insert("ReDAO.insertIn", incentive);
		
		log.debug("IncentiveDAOImpl insertIn n : " + n);
		
		return n;
	}

//	성과금 수정
	@Override
	public void updateIn(Incentive incentive) {
		
		log.debug("IncentiveDAOImpl updateIn incentive : " + incentive);
		
		sqlSession.update("ReDAO.updateIn", incentive);
	}

	@Override
	public void deleteIn(int reCode) {
		
		log.debug("IncentiveDAOImpl deleteIn reCode : " + reCode);
		
		sqlSession.delete("ReDAO.deleteIn", reCode);
	}	
}