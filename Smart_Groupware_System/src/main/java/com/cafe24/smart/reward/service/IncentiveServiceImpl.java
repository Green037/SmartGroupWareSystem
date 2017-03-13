package com.cafe24.smart.reward.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.payment.dao.PaymentDAO;
import com.cafe24.smart.reward.dao.IncentiveDAO;
import com.cafe24.smart.reward.dao.RewardDAO;
import com.cafe24.smart.reward.domain.Incentive;
import com.cafe24.smart.reward.domain.Reward;
import com.cafe24.smart.util.UtilDate;

@Service
public class IncentiveServiceImpl implements IncentiveService {
	private static final Logger log = LoggerFactory.getLogger(RewardServiceImpl.class);

	@Autowired
	IncentiveDAO incentiveDAO;
	
	@Autowired
	PaymentDAO paymentDAO;
	
	@Autowired
	RewardDAO rewardDAO;
	
//	특정 날짜의 성과금 받기
	@Override
	public Incentive inListServ(int reCode) {
		
		System.out.println("IncentiveServiceImpl inListServ reCode : " + reCode);
		
		return incentiveDAO.selectIn(reCode);
	}
	
//	인센티브 추가
	@Override
	public int inAddServ(Reward reward) {
		
		System.out.println("IncentiveServiceImpl inAddServ reward : " + reward);
		
		Incentive incentive = new Incentive();
		
		UtilDate utilDate = new UtilDate();
		
		incentive.setReCode(rewardDAO.selectByReDateRe(reward.getReDate()))
				.setMmCode(reward.getMmCode())
				.setInPossible(false)
				.setInDate(null)
				.setInBonus(paymentDAO.selectByPc(reward.getMmCode(), utilDate.getPaymentDate()))
				.setInMmCode(reward.getReMmCode());
		
		System.out.println("IncentiveServiceImpl inAddServ incentive : " + incentive);
		
		return incentiveDAO.insertIn(incentive);
	}	
}