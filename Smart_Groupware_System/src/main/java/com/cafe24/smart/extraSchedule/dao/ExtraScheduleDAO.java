package com.cafe24.smart.extraSchedule.dao;


import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;

public interface ExtraScheduleDAO {
	
	int insertVa(ExtraSchedule extraSchedule);
	int insertWo(ExtraSchedule extraSchedule);
	
}