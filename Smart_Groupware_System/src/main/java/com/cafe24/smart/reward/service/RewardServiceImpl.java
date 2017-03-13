package com.cafe24.smart.reward.service;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.dao.MemberDAO;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.reward.dao.RewardDAO;
import com.cafe24.smart.reward.domain.Reward;

@Service
public class RewardServiceImpl implements RewardService {
	private static final Logger log = LoggerFactory.getLogger(RewardServiceImpl.class);
	
	@Autowired
	RewardDAO rewardDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
//	인사부 > 총고과목록
	@Override
	public List<Reward> reListServ() {
		
		return rewardDAO.selectAllRe();
	}
	
//	연간 고과내역 조회
	@Override
	public List<Reward> reListYearServ(int mmCode, String startDate, String endDate) {
		
		System.out.println("RewardServiceImpl reListYearServ mmCode : " + mmCode
					+ ", startDate : " + startDate + ", endDate : " + endDate);
		
		List<Reward> reYearList = rewardDAO.selectAllYearRe(mmCode, startDate, endDate);
		
		return reYearList;
	}

//	고과기록정보조회
	@Override
	public Reward reContentServ(int mmCode, String startDate, String endDate) {
		
		System.out.println("RewardServiceImpl reContentServ mmCode : " + mmCode + ", startDate : " + startDate + 
								", endDate : " + endDate);
		
		return rewardDAO.selectRe(mmCode, startDate, endDate);
	}

//	인사부 > 특정 사원 고과내역 조회
	@Override
	public Reward reListByReCodeServ(int reCode) {
		
		System.out.println("RewardServiceImpl reListByReCodeServ reCode : " + reCode);
		
		return rewardDAO.selectByReCodeRe(reCode);
	}

//	고과기록정보조회시 특정 사원 정보 조회
	@Override
	public Member mmContentServ(int mmCode) {
		
		System.out.println("RewardServiceImpl mmContentServ mmCode : " + mmCode);
		
		return memberDAO.selectByMm(mmCode);
	}
	
//	고과내역 count
	@Override
	public int reCountAllServ() {
		
		return rewardDAO.selectAllCountRe();
	}

//	인사부 > 고과내력 추가
	@Override
	public int reAddServ(String uploadPath, Reward reward) {
		
		System.out.println("RewardServiceImpl reAddServ uploadPath : " + uploadPath);
		System.out.println("RewardServiceImpl reAddServ reward : " + reward);
		
		reward.setReDocument(uploadPath);
		
		System.out.println("RewardServiceImpl reAddServ getRedocument : " + reward.getReDocument());
		
		return rewardDAO.insertRe(reward);
	}
}