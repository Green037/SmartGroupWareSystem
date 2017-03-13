package com.cafe24.smart.reward.dao;

import com.cafe24.smart.reward.domain.Incentive;

public interface IncentiveDAO {
	Incentive			selectIn(int reCode);
	
	int					insertIn(Incentive incentive);
}