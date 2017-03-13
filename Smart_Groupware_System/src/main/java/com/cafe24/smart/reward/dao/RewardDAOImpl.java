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
import com.cafe24.smart.util.UtilDate;

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
	
//	인사부 > 총고과목록 조회
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
	
//	인사부 > 특정 고과내역 조회
	@Override
	public Reward selectByReCodeRe(int reCode) {
		
		System.out.println("RewardDAOImpl reListByReCodeServ reCode : " + reCode);
		
		Reward reward = sqlSession.selectOne("ReDAO.selectByReCodeRe", reCode);		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		System.out.println("RewardDAOImpl selectByReCodeRe reward : " + reward);
		System.out.println("RewardDAOImpl selectByReCodeRe selectAllCountRe : " + this.selectAllCountRe);
		
		return reward;
	}
	
	@Override
	public int selectByReDateRe(String reDate) {
		
		System.out.println("RewardDAOImpl reListByReCodeServ reDate : " + reDate);
		
		return sqlSession.selectOne("ReDAO.selectByReDateRe", reDate);
	}

	//고과기록정보조회
	@Override
	public Reward selectRe(int mmCode, String startDate, String endDate) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		System.out.println("RewardDAOImpl selectRe mmCode : " + mmCode);
		System.out.println("RewardDAOImpl selectRe params : " + params);
		
		Reward reward = sqlSession.selectOne("ReDAO.selectRe", params);
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		System.out.println("RewardDAOImpl selectRe reward : " + reward);
		
		return reward;
	}

	@Override
	public int insertRe(Reward reward) {
		
		System.out.println("RewardDAOImpl insertRe reward : " + reward);
		
		int result = sqlSession.insert("ReDAO.insertRe", reward);
		
		System.out.println("RewardDAOImpl insertRe result : " + result);
		
		return result;
	}
}