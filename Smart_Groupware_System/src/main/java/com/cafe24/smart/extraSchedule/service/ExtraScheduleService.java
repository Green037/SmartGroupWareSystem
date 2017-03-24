
package com.cafe24.smart.extraSchedule.service;

import org.springframework.stereotype.Service;

import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;

@Service
public interface ExtraScheduleService {
	int addEsVaServ(ExtraSchedule extraSchedule);
	int addEsWoServ(ExtraSchedule extraSchedule);
}
