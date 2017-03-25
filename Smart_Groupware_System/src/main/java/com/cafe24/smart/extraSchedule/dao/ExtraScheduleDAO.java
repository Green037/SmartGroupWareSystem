package com.cafe24.smart.extraSchedule.dao;


import java.util.List;
import java.util.Map;


import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;

public interface ExtraScheduleDAO {
	
	int insertVa(ExtraSchedule extraSchedule);
	int insertWo(ExtraSchedule extraSchedule);
	
	List<ExtraSchedule> selectPersonalEs(ExtraSchedule extraSchedule);
	
}