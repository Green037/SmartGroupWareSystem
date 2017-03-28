
package com.cafe24.smart.extraSchedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.extraSchedule.dao.ExtraScheduleDAO;
import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.member.domain.Member;

@Service
public class ExtraScheduleServiceImpl implements ExtraScheduleService {

	private static final Logger log = LoggerFactory.getLogger(ExtraScheduleServiceImpl.class);

	@Autowired
	private ExtraScheduleDAO extraScheduleDao;

	// 근외검색
	@Override
	public List<ExtraSchedule> esPersonalListServ(ExtraSchedule extraSchedule) {

		log.debug("ExtraScheduleServiceImpl esPersonalListServ extraSchedule : " + extraSchedule);

		return extraScheduleDao.selectPersonalEs(extraSchedule);
	}

	// 부서 근외검색 에서 부서리스트 불러오기
	@Override
	public List<Member> esSearchMmServ(int dpCode) {

		log.debug("ExtraScheduleServiceImpl esSearchMmServ dpCode : " + dpCode);

		return extraScheduleDao.selectByDpCodeMm(dpCode);
	}

	// 부서 근외 검색
	@Override
	public List<ExtraSchedule> esDpListServ(String startDate, String endDate, int dpCode, int mmCode) {

		log.debug("ExtraScheduleServiceImpl esDpListServ startDate : " + startDate + ", endDate : " + endDate);
		log.debug("ExtraScheduleServiceImpl esDpListServ dpCode : " + dpCode + ", mmCode : " + mmCode);

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("dpCode", dpCode);
		paramMap.put("mmCode", mmCode);
		paramMap.put("esStartDate", startDate);
		paramMap.put("esEndDate", endDate);

		log.debug("ExtraScheduleServiceImpl esDpListServ paramMap : " + paramMap);

		return extraScheduleDao.selectDpEs(paramMap);
	}

	@Override
	public ExtraSchedule esListServ(int esCode) {

		log.debug("ExtraScheduleServiceImpl esListServ esCode : " + esCode);

		return extraScheduleDao.selectEs(esCode);
	}

	// 휴가신청
	@Override
	public int addEsVaServ(ExtraSchedule extraSchedule) {

		log.debug("ExtraScheduleServiceImpl addEsVaServ extraSchedule : " + extraSchedule);

		return extraScheduleDao.insertVa(extraSchedule);
	}

	// 출장신청
	@Override
	public int addEsWoServ(ExtraSchedule extraSchedule) {

		log.debug("ExtraScheduleServiceImpl addEsWoServ extraSchedule : " + extraSchedule);

		return extraScheduleDao.insertWo(extraSchedule);
	}
}