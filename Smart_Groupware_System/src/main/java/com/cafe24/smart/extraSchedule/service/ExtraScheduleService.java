
package com.cafe24.smart.extraSchedule.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.member.domain.Member;

@Service
public interface ExtraScheduleService {
	int addEsVaServ(ExtraSchedule extraSchedule);
	int addEsWoServ(ExtraSchedule extraSchedule);
	
	
	List<ExtraSchedule> esPersonalListServ(ExtraSchedule extraSchedule);
	List<Member> esSearchMmServ(int dpCode);
	List<ExtraSchedule> esDpListServ(int dpCode, int mmCode);
}
