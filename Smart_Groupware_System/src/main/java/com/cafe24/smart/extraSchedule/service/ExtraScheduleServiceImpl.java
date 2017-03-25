
package com.cafe24.smart.extraSchedule.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.extraSchedule.dao.ExtraScheduleDAO;
import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.member.domain.Member;
@Service
public class ExtraScheduleServiceImpl implements ExtraScheduleService{

	@Autowired
	private ExtraScheduleDAO extraScheduleDao;
	
	//휴가신청
	@Override
	public int addEsVaServ(ExtraSchedule extraSchedule) {
		//System.out.println("연차신청등록확인"+extraSchedule);
		return extraScheduleDao.insertVa(extraSchedule);
	}

	//출장신청
	@Override
	public int addEsWoServ(ExtraSchedule extraSchedule) {
		// TODO Auto-generated method stub
		return extraScheduleDao.insertWo(extraSchedule);
	}
	//근외검색
	@Override
	public List<ExtraSchedule> esPersonalListServ(ExtraSchedule extraSchedule) {
		// TODO Auto-generated method stub
		
		
		
		return extraScheduleDao.selectPersonalEs(extraSchedule);
	}
	//부서 근외검색 에서 부서리스트 불러오기
	@Override
	public List<Member> esSearchMmServ(int dpCode) {
		// TODO Auto-generated method stub
		return extraScheduleDao.selectByDpCodeMm(dpCode);
	}
	// 부서 근외 검색
	@Override
	public List<ExtraSchedule> esDpListServ(int dpCode, int mmCode) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("dpCode", dpCode);
		paramMap.put("mmCode", mmCode);
		
		return extraScheduleDao.selectDpEs(paramMap);
	}
	
}
