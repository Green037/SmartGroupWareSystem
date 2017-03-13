package com.cafe24.smart.commute.dao;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.commute.domain.Commute;

@Repository
public interface CommuteDAO {
	int insertOnTimeCm(Commute commute);
	int selectCountTodayCm(Commute commute);
	Commute selectOnTimeTodayCm(Commute commute);
	int updateOnTimeTodayCm(Commute commute);

}