package com.cafe24.smart.commute.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.commute.dao.CommuteDAO;
import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.util.UtilDate;

@Service
public class CommuteServiceImpl implements CommuteService {

	@Autowired
	private CommuteDAO commuteDao;
	
	UtilDate utilDate;
	
	//출근등록
	@Override
	public int addOnTimeServ(Commute commute) {
		// 1. 현재시간 구하기 - util패키지의 공용메서드 사용.
		utilDate = new UtilDate();
		commute.setCmOnTime(utilDate.getCurrentTime());
		/*System.out.println("현재시간 : "+commute.getCmOnTime());*/
		
		// 2. situation컬럼 근무중으로 세팅.
		commute.setCmSituation("근무중");
		
		return commuteDao.insertOnTimeCm(commute);
	}

	// 오늘자 출첵 햇는지 확인.
	@Override
	public int cmCountByTodayServ(Commute commute) {
		// 현재 날짜 구하기
		utilDate = new UtilDate();
		commute.setCmDate(utilDate.getCurrentDate());
		/*System.out.println("현재 날짜 : "+utilDate.getCurrentDate());*/
		
		// 현재날짜에 출근체크된 사원정보가 있는지 조회하기
		
		return commuteDao.selectCountTodayCm(commute);
	}

	//당일 출근데이터 조회
	@Override
	public Commute cmOnTimeTodayServ(Commute commute) {
		// 오늘 날짜 등록
		utilDate = new UtilDate();
		commute.setCmDate(utilDate.getCurrentDate());
		System.out.println("현재 날짜 : "+utilDate.getCurrentDate());
		
		// 오늘자 출근데이터 조회
		
		return commuteDao.selectOnTimeTodayCm(commute);
	}

	// 당일 출근데이터에 퇴근정보 등록
	@Override
	public int cmOffTimeServ(Commute commute) {
		// 1. 현재시간 세팅
		utilDate = new UtilDate();
		commute.setCmOffTime(utilDate.getCurrentTime());
		System.out.println("현재시간 : "+commute.getCmOnTime());
		
		// 2. situration컬럼 퇴근으로 세팅
		commute.setCmSituation("퇴근");
		
		return commuteDao.updateOnTimeTodayCm(commute);
	}

}
