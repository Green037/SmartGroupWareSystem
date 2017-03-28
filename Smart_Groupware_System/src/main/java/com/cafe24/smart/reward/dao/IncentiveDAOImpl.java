package com.cafe24.smart.reward.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.reward.domain.Incentive;

@Repository
public class IncentiveDAOImpl implements IncentiveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
//	특정 고과 번호의 성과금 보기
	@Override
	public Incentive selectIn(int reCode) {
		
		System.out.println("IncentiveDAOImpl selectIn reCode : " + reCode);
		
		return sqlSession.selectOne("ReDAO.selectIn", reCode);
	}
	
//	성과금 추가
	@Override
	public int insertIn(Incentive incentive) {
		
		int n = 0;
		
		System.out.println("IncentiveDAOImpl insertIn incentive : " + incentive);
		
		n = sqlSession.insert("ReDAO.insertIn", incentive);
		
		System.out.println("IncentiveDAOImpl insertIn n : " + n);
		
		return n;
	}

//	성과금 수정
	@Override
	public void updateIn(Incentive incentive) {
		
		System.out.println("IncentiveDAOImpl updateIn incentive : " + incentive);
		
		sqlSession.update("ReDAO.updateIn", incentive);
	}

	@Override
	public void deleteIn(int reCode) {
		
		System.out.println("IncentiveDAOImpl deleteIn reCode : " + reCode);
		
		sqlSession.delete("ReDAO.deleteIn", reCode);
	}	
}