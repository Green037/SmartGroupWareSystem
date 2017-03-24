package com.cafe24.smart.extraSchedule.service;

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
	
	
	
}
