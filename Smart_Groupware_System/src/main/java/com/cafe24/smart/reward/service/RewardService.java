package com.cafe24.smart.reward.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.reward.domain.Reward;

@Service
public interface RewardService {
	List<Reward>			reListServ();
	List<Reward>			reListYearServ(int mmCode, String startDate, String endDate);
	List<Reward>			reContentServ(int mmCode, String reDate);
	
	Member					mmContentServ(int mmCode);
	
	int						reCountAllServ();
	
	int 					reAddServ(String uploadPath, Reward reward);
}