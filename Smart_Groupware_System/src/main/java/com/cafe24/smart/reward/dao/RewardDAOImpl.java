package com.cafe24.smart.reward.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.smart.reward.domain.Reward;

@Repository
public class RewardDAOImpl implements RewardDAO {

	private static final Logger log = LoggerFactory.getLogger(RewardDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate sqlSession;

	int selectAllCountRe;
	
	@Override
	public int selectAllCountRe() {
		
		return selectAllCountRe;
	}
	
	@Override
	public List<Reward> selectAllRe() {
		
		List<Reward> reList = sqlSession.selectList("ReDAO.selectAllRe");		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		System.out.println("RewardDAOImpl selectAllRe reList : " + reList);
		System.out.println("RewardDAOImpl selectAllRe selectAllCountRe : " + this.selectAllCountRe);
		
		return reList;
	}
	
//	연간 고과내역 조회
	@Override
	public List<Reward> selectAllYearRe(int mmCode, String startDate, String endDate) {
		
		System.out.println("RewardDAOImpl selectAllYearRe mmCode : " + mmCode + ", startDate : " + startDate + ", endDate : " + endDate);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		System.out.println("RewardDAOImpl selectAllYearRe params : " + params);
		
		List<Reward> reYearList = sqlSession.selectList("ReDAO.selectAllYearRe", params);
		
		System.out.println("RewardDAOImpl selectAllYearRe reYearList : " + reYearList);
		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		
		System.out.println("RewardDAOImpl selectAllYearRe selectAllCountRe : " + this.selectAllCountRe);
		
		return reYearList;
	}
	
//	@Override
//	public List<Reward> selectAllRe(int mmCode, String reDate) {
//		
////		List<Reward> rewardList = new ArrayList<Reward>();
//		
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		
//		params.put("mmCode", mmCode);
//		params.put("reDate", reDate);
//		
//		System.out.println("RewardDAOImpl selectAllRe mmCode : " + mmCode);
//		System.out.println("RewardDAOImpl selectAllRe params : " + params);
//		
//		List<Reward> rewardList = sqlSession.selectList("ReDAO.selectAllRe", params);		
//		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
//		
//		System.out.println("RewardDAOImpl selectAllRe rewardList : " + rewardList);
//		System.out.println("RewardDAOImpl selectAllRe selectAllCountRe : " + this.selectAllCountRe);
//		
//		return rewardList;
//	}

	@Override
	public int insertRe(Reward reward) {
		
		System.out.println("RewardDAOImpl insertRe reward : " + reward);
		
		int result = sqlSession.insert("ReDAO.insertRe", reward);
		
		System.out.println("RewardDAOImpl insertRe result : " + result);
		
		return result;
	}

	
}