package com.cafe24.smart.commute.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.commute.dao.CommuteDAO;
import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.member.domain.Member;
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
		/*System.out.println("현재 날짜 : "+utilDate.getCurrentDate());*/
		
		// 오늘자 출근데이터 조회
		
		return commuteDao.selectOnTimeTodayCm(commute);
	}

	// 당일 출근데이터에 퇴근정보 등록
	@Override
	public int cmOffTimeServ(Commute commute) {
		// 1. 현재시간 세팅
		utilDate = new UtilDate();
		commute.setCmOffTime(utilDate.getCurrentTime());
		/*System.out.println("현재시간 : "+commute.getCmOnTime());*/
		
		// 2. situration컬럼 퇴근으로 세팅
		commute.setCmSituation("퇴근");
		
		// 3. 출근시간과 퇴근시간을 회사 출퇴근 정상시간과 비교하여 "정상","지각","조기퇴근"으로 분기세팅.
		int compareOntime = commute.getCmOnTime().compareTo("09:00:00");
		int compareOffTime = commute.getCmOffTime().compareTo("18:00:00");
		
		if(compareOntime > 0 && compareOffTime >= 0){ //지각
			commute.setCmCheckToday("지각");
		}else if(compareOntime <= 0 && compareOffTime >= 0){ //정상
			commute.setCmCheckToday("정상");
		}else if(compareOntime <= 0 && compareOffTime < 0){ //조기퇴근
			commute.setCmCheckToday("조기퇴근");
		}else if(compareOntime > 0 && compareOffTime < 0){ //결근과동일
			commute.setCmCheckToday("결근");
		}
		return commuteDao.updateOnTimeTodayCm(commute);
	}

	//외출등록
	@Override
	public int cmGoOutServ(Commute commute) {
		// 1.현재시간 세팅
		utilDate = new UtilDate();
		commute.setCmGoOutTime(utilDate.getCurrentTime());
		/*System.out.println("현재시간 : "+utilDate.getCurrentTime());*/
		
		// 2.situration 외출중으로 세팅
		commute.setCmSituation("외출중");
		
		return commuteDao.updateGoOutTodayCm(commute);
	}

	//외출복귀등록.
	@Override
	public int cmReturnServ(Commute commute) {
		//1. 현재시간 세팅
		utilDate = new UtilDate();
		commute.setCmReturnTime(utilDate.getCurrentTime());
		System.out.println("현재시간 : "+utilDate.getCurrentTime());
		
		//2. situration 근무중으로 세팅
		commute.setCmSituation("근무중");
		
		return commuteDao.updateReturnTodayCm(commute);
	}

	//개인 출퇴근 이력조회
	@Override
	public List<Commute> cmPersonalListServ(int mmCode, String startDay, String endDay) {
		// 1.매개변수들 맵으로 세팅
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mmCode", mmCode);
		paramMap.put("startDay", startDay);
		paramMap.put("endDay", endDay);
		
		return commuteDao.selectPersonalCm(paramMap);
	}

	//부서코드로 해당 부서 직원조회
	@Override
	public List<Member> cmSearchMmServ(int dpCode) {
		// TODO Auto-generated method stub
		return commuteDao.selectByDpCodeMm(dpCode);
	}

	//부서별 관리자 사원근태 조회
	@Override
	public List<Commute> cmDpListServ(String startDay, String endDay, int dpCode, int mmCode) {
		// 1.매개변수들 맵으로 세팅.
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDay", startDay);
		paramMap.put("endDay", endDay);
		paramMap.put("dpCode", dpCode);
		paramMap.put("mmCode", mmCode);
		
		// 2.조건별 조회하는 매서드 호출
		return commuteDao.selectByDpCm(paramMap);
	}

}
