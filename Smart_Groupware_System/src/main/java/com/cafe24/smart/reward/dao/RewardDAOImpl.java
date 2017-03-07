package com.cafe24.smart.reward.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	
	public int getSelectAllCountRe() {
		
		return selectAllCountRe;
	}
	
	@Override
	public List<Reward> selectAllRe(int mmCode, String reDate) {
		
//		List<Reward> rewardList = new ArrayList<Reward>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("reDate", reDate);
		
		System.out.println("RewardDAOImpl selectAllRe mmCode : " + mmCode);
		System.out.println("RewardDAOImpl selectAllRe params : " + params);
		
		List<Reward> rewardList = sqlSession.selectList("ReDAO.selectAllRe", params);		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		System.out.println("RewardDAOImpl selectAllRe rewardList : " + rewardList);
		System.out.println("RewardDAOImpl selectAllRe selectAllCountRe : " + this.selectAllCountRe);
		
		return rewardList;
	}

	@Override
	public int insertRe(Reward reward) {
		
		System.out.println("RewardDAOImpl insertRe reward : " + reward);
		
		return 0;
	}
}