package com.cafe24.smart.commute.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.member.domain.Member;

@Repository
public interface CommuteDAO {
	
	List<Commute> 						selectPersonalCm(Map<String, Object> paramMap);
	List<Member> 						selectByDpCodeMm(int dpCode);
	List<Commute> 						selectByDpCm(Map<String, Object> paramMap);
	
	Commute 							selectOnTimeTodayCm(Commute commute);
	
	int 								selectCountTodayCm(Commute commute);
	int 								insertOnTimeCm(Commute commute);
	int 								updateOnTimeTodayCm(Commute commute);
	int 								updateGoOutTodayCm(Commute commute);
	int 								updateReturnTodayCm(Commute commute);
}