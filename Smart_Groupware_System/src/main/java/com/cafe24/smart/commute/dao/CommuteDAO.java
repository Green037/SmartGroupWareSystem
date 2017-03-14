package com.cafe24.smart.commute.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.member.domain.Member;

@Repository
public interface CommuteDAO {
	int insertOnTimeCm(Commute commute);
	int selectCountTodayCm(Commute commute);
	Commute selectOnTimeTodayCm(Commute commute);
	int updateOnTimeTodayCm(Commute commute);
	int updateGoOutTodayCm(Commute commute);
	int updateReturnTodayCm(Commute commute);
	
	List<Commute> selectPersonalCm(Map<String, Object> paramMap);
	List<Member> selectByDpCodeMm(int dpCode);
	List<Commute> selectByDpCm(Map<String, Object> paramMap);
}