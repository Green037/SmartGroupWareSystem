
package com.cafe24.smart.extraSchedule.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.extraSchedule.dao.ExtraScheduleDAO;
import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
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
	
}
