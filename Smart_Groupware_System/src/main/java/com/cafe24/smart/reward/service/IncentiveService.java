package com.cafe24.smart.reward.service;

import com.cafe24.smart.reward.domain.Incentive;
import com.cafe24.smart.reward.domain.Reward;

public interface IncentiveService {
	Incentive			inListServ(int reCode);
	
	int					inAddServ(Reward reward);
}