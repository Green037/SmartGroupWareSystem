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

	int selectAllCountRe = 0;
	
//	인사부 > 총고과목록 조회
	@Override
	public List<Reward> selectAllRe() {
		
		List<Reward> reList = sqlSession.selectList("ReDAO.selectAllRe");		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		log.debug("RewardDAOImpl selectAllRe reList : " + reList);
		log.debug("RewardDAOImpl selectAllRe selectAllCountRe : " + this.selectAllCountRe);
		
		return reList;
	}
	
//	연간 고과내역 조회
	@Override
	public List<Reward> selectAllYearRe(int mmCode, String startDate, String endDate) {
		
		log.debug("RewardDAOImpl selectAllYearRe mmCode : " + mmCode + ", startDate : " + startDate + ", endDate : " + endDate);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		log.debug("RewardDAOImpl selectAllYearRe params : " + params);
		
		List<Reward> reYearList = sqlSession.selectList("ReDAO.selectAllYearRe", params);
		
		log.debug("RewardDAOImpl selectAllYearRe reYearList : " + reYearList);
		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		
		log.debug("RewardDAOImpl selectAllYearRe selectAllCountRe : " + this.selectAllCountRe);
		
		return reYearList;
	}
	
//	인사부 > 특정 고과내역 조회
	@Override
	public Reward selectByReCodeRe(int reCode) {
		
		log.debug("RewardDAOImpl reListByReCodeServ reCode : " + reCode);
		
		Reward reward = sqlSession.selectOne("ReDAO.selectByReCodeRe", reCode);		
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		log.debug("RewardDAOImpl selectByReCodeRe reward : " + reward);
		log.debug("RewardDAOImpl selectByReCodeRe selectAllCountRe : " + this.selectAllCountRe);
		
		return reward;
	}
	
	@Override
	public int selectByReDateRe(int mmCode, String reDate) {
		
		log.debug("RewardDAOImpl reListByReCodeServ reDate : " + reDate);
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("reDate", reDate);
		
		return sqlSession.selectOne("ReDAO.selectByReDateRe", params);
	}

	//고과기록정보조회
	@Override
	public Reward selectRe(int mmCode, String startDate, String endDate) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("mmCode", mmCode);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		log.debug("RewardDAOImpl selectRe mmCode : " + mmCode);
		log.debug("RewardDAOImpl selectRe params : " + params);
		
		Reward reward = sqlSession.selectOne("ReDAO.selectRe", params);
		this.selectAllCountRe = sqlSession.selectOne("ReDAO.selectAllCountRe");
		
		log.debug("RewardDAOImpl selectRe reward : " + reward);
		
		return reward;
	}
	
//	이전 쿼리의 총 갯수 조회
	@Override
	public int selectAllCountRe() {
		
		return selectAllCountRe;
	}

//	인사부 > 고과내역 추가
	@Override
	public int insertRe(Reward reward) {
		
		log.debug("RewardDAOImpl insertRe reward : " + reward);
		
		int result = sqlSession.insert("ReDAO.insertRe", reward);
		
		log.debug("RewardDAOImpl insertRe result : " + result);
		
		return result;
	}

//	고과내역 수정
	@Override
	public void updateRe(Reward reward) {
		
		log.debug("RewardDAOImpl insertRe reward : " + reward);
		
		sqlSession.update("ReDAO.updateRe", reward);
	}

//	고과내역 삭제
	@Override
	public void deleteRe(int reCode) {
		
		log.debug("RewardDAOImpl deleteRe reCode : " + reCode);
		
		sqlSession.delete("ReDAO.deleteRe", reCode);
	}
}