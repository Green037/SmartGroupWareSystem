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
	
	@Override
	public List<Reward> reContentServ(int mmCode, String reDate) {
		
		System.out.println("RewardServiceImpl pcReContentServ mmCode : " + mmCode);
		
		return rewardDAO.selectAllRe(mmCode, reDate);
	}

	@Override
	public Member mmContentServ(int mmCode) {
		
		System.out.println("RewardServiceImpl mmContentServ mmCode : " + mmCode);
		
		return memberDAO.selectByMm(mmCode);
	}

//	@Override
//	public int reAddServ(Reward reward) {
//		
//		System.out.println("RewardServiceImpl reAddServ reward : " + reward);
//		
//		return 0;
//	}

	
}