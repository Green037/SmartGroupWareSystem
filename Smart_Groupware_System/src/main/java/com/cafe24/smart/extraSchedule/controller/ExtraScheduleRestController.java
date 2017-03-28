package com.cafe24.smart.extraSchedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.extraSchedule.service.ExtraScheduleService;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.controller.ProjectController;

@RestController
public class ExtraScheduleRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	ExtraScheduleService extraScheduleService;

	// 연차 등록 POST
	@RequestMapping(value = "es/addEsVa", method = RequestMethod.POST)
	public Map<String, Object> esAddCtrl(ExtraSchedule extraSchedule) {
		
		log.debug("ExtraScheduleRestController esAddCtrl extraSchedule : " + extraSchedule);
		
		// log.debug("연차등록값확인:"+extraSchedule);
		int result = extraScheduleService.addEsVaServ(extraSchedule);
		
		log.debug("ExtraScheduleRestController esAddCtrl result : " + result);
		
		Map<String, Object> reMap = new HashMap<String, Object>();

		// 입력여부 비교하여 성공,실패 체크후 리턴해주기
		if (result != 0) {
			reMap.put("check", "성공");
			
			extraSchedule = extraScheduleService.esListServ(extraSchedule.getEsCode());
			
			reMap.put("extraSchedule", extraSchedule);
		} else {
			reMap.put("check", "실패");
		}

		log.debug("ExtraScheduleRestController esAddCtrl reMap : " + reMap);
		
		return reMap;
	}

	// 출장 등록 POST
	@RequestMapping(value = "es/addEsWo", method = RequestMethod.POST)
	public Map<String, Object> esWoAddCtrl(ExtraSchedule extraSchedule) {
		
		log.debug("ExtraScheduleRestController esWoAddCtrl extraSchedule : " + extraSchedule);
		
		int result = extraScheduleService.addEsWoServ(extraSchedule);

		log.debug("ExtraScheduleRestController esWoAddCtrl result : " + result);
		
		Map<String, Object> reMap = new HashMap<String, Object>();

		// 입력여부 비교하여 성공,실패 체크후 리턴해주기
		if (result != 0) {
			reMap.put("check", "성공");
			
			extraSchedule = extraScheduleService.esListServ(extraSchedule.getEsCode());
			
			reMap.put("extraSchedule", extraSchedule);
		} else {
			reMap.put("check", "실패");
		}
		
		log.debug("ExtraScheduleRestController esWoAddCtrl reMap : " + reMap);

		return reMap;
	}

	// POST 본인 근외일정 검색조회 - 포스트요청
	@RequestMapping(value = "es/search", method = RequestMethod.POST)
	public List<ExtraSchedule> esSearchCtrl(ExtraSchedule extraSchedule, HttpSession session) {
		
		log.debug("ExtraScheduleRestController esSearchCtrl extraSchedule : " + extraSchedule);
		
		// 세션에서 로긴 되있는 사원코드 가져와서 날짜와 조건 일치하는 데이터 조회
		List<ExtraSchedule> esList = extraScheduleService.esPersonalListServ(extraSchedule);
		
		log.debug("ExtraScheduleRestController esSearchCtrl esList : " + esList);

		return esList;
	}

	// 부서코드로 해당부서 사원조회 - 포스트요청
	@RequestMapping(value = "es/searchMm", method = RequestMethod.POST)
	public List<Member> esSearchMmCtrl(@RequestParam("dpCode") int dpCode) {
		
		log.debug("ExtraScheduleRestController esSearchMmCtrl dpCode : " + dpCode);
		
		// dpCode로 해당되는 맴버 정도 다 가져오기
		List<Member> mmList = extraScheduleService.esSearchMmServ(dpCode);
		
		log.debug("ExtraScheduleRestController esSearchMmCtrl mmList : " + mmList);		
				
		return mmList;
	}

	// POST 부서 근외일정 조회
	@RequestMapping(value = "es/searchAll", method = RequestMethod.POST)
	public List<ExtraSchedule> esSearchAllCtrl(@RequestParam("esStartDate") String startDate,
			@RequestParam("esEndDate") String endDate, @RequestParam("dpCode") int dpCode,
			@RequestParam(value = "mmCode", defaultValue = "0") int mmCode) {

		log.debug("ExtraScheduleRestController esSearchMmCtrl startDate : " + startDate + ", endDate : " + endDate);		
		log.debug("ExtraScheduleRestController esSearchMmCtrl dpCode : " + dpCode + ", mmCode : " + mmCode);		
		

		List<ExtraSchedule> esList = extraScheduleService.esDpListServ(startDate, endDate, dpCode, mmCode);
	
		log.debug("ExtraScheduleRestController esSearchMmCtrl esList : " + esList);		
		
		return esList;
	}
}