package com.cafe24.smart.reward.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.payment.dao.PaymentDAO;
import com.cafe24.smart.project.dao.ProjectDAO;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.reward.dao.IncentiveDAO;
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
	ProjectDAO projectDAO;
	
	@Override
	public int inAddServ(Reward reward) {
		
		System.out.println("IncentiveServiceImpl inAddServ reward : " + reward);
		
		String inKind = "";
		
		Incentive incentive = new Incentive();
		
		UtilDate utilDate = new UtilDate();
		
		incentive.setReDate(reward.getReDate())
				.setMmCode(reward.getMmCode())
				.setInKind(inKind)
				.setInBonus(paymentDAO.selectByPc(reward.getMmCode(), utilDate.getPaymentDate()))
				.setInPossible(false)
				.setInDate(null)
				.setInMmCode(reward.getReMmCode());
		
		System.out.println("IncentiveServiceImpl inAddServ incentive : " + incentive);
		
		return incentiveDAO.insertIn(incentive);
	}
}