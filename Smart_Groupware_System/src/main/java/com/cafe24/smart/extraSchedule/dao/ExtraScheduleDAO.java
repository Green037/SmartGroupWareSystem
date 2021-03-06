package com.cafe24.smart.extraSchedule.dao;


import java.util.List;
import java.util.Map;


import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.member.domain.Member;

public interface ExtraScheduleDAO {
	
	List<ExtraSchedule> 					selectPersonalEs(ExtraSchedule extraSchedule);
	List<ExtraSchedule> 					selectDpEs(Map<String, Object> paramMap);
	List<Member> 							selectByDpCodeMm(int dpCode);
	
	ExtraSchedule 							selectEs(int esCode);
	
	int 									insertVa(ExtraSchedule extraSchedule);
	int 									insertWo(ExtraSchedule extraSchedule);	
}