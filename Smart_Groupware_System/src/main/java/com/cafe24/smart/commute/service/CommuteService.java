package com.cafe24.smart.commute.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.member.domain.Member;

@Service
public interface CommuteService {
	
	List<Commute> 						cmPersonalListServ(int mmCode, String startDay, String endDay);
	List<Commute> 						cmDpListServ(String startDay, String endDay, int dpCode, int mmCode);
	List<Member> 						cmSearchMmServ(int dpCode);
	
	Commute 							cmOnTimeTodayServ(Commute commute);
	
	int 								cmCountByTodayServ(Commute commute);
	int 								cmOffTimeServ(Commute commute);
	int 								cmGoOutServ(Commute commute);
	int 								cmReturnServ(Commute commute);	
	
	int 								addOnTimeServ(Commute commute);
}