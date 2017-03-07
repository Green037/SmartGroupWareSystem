package com.cafe24.smart.reward.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.reward.domain.Reward;

@Repository
public interface RewardDAO {
	List<Reward>			selectAllRe(int mmCode, String reDate);
	
	int						insertRe(Reward reward);
}