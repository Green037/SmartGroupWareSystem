package com.cafe24.smart.commute.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.member.domain.Member;

@Service
public interface CommuteService {
	int addOnTimeServ(Commute commute);
	int cmCountByTodayServ(Commute commute);
	int cmOffTimeServ(Commute commute);
	int cmGoOutServ(Commute commute);
	int cmReturnServ(Commute commute);
	
	List<Commute> cmPersonalListServ(int mmCode, String startDay, String endDay);
	Commute cmOnTimeTodayServ(Commute commute);
	List<Member> cmSearchMmServ(int dpCode);
	List<Commute> cmDpListServ(String startDay, String endDay, int dpCode, int mmCode);

}
