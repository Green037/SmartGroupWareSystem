package com.cafe24.smart.commute.service;

import org.springframework.stereotype.Service;

import com.cafe24.smart.commute.domain.Commute;

@Service
public interface CommuteService {
	int addOnTimeServ(Commute commute);
	int cmCountByTodayServ(Commute commute);
	int cmOffTimeServ(Commute commute);
	
	Commute cmOnTimeTodayServ(Commute commute);

}
