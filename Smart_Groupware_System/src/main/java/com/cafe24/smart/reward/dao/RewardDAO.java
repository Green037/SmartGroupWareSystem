package com.cafe24.smart.reward.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.reward.domain.Reward;

@Repository
public interface RewardDAO {
	List<Reward>			selectAllRe();
	List<Reward>			selectAllYearRe(int mmCode, String startDate, String endDate);
	
	Reward					selectRe(int mmCode, String startDate, String endDate);
	Reward					selectByReCodeRe(int reCode);
	
	int 					selectByReDateRe(int mmCode, String reDate);
	int 					selectAllCountRe();
	int						insertRe(Reward reward);
	
	void					updateRe(Reward reward);
	void					deleteRe(int reCode);
}