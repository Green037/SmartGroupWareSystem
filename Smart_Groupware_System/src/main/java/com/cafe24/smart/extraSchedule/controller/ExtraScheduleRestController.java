package com.cafe24.smart.extraSchedule.controller;

import java.util.ArrayList;
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

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.extraSchedule.domain.ExtraSchedule;
import com.cafe24.smart.extraSchedule.service.ExtraScheduleService;
import com.cafe24.smart.project.controller.ProjectController;

@RestController
public class ExtraScheduleRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	ExtraScheduleService extraScheduleService;
	
	//연차 등록 POST
	@RequestMapping(value = "es/addEsVa", method = RequestMethod.POST)
	public Map<String, Object> esAddCtrl(ExtraSchedule extraSchedule){
		//System.out.println("연차등록값확인:"+extraSchedule);
		int result = extraScheduleService.addEsVaServ(extraSchedule);
		
		Map<String, Object> reMap = new HashMap<String, Object>();
	
		//입력여부 비교하여 성공,실패 체크후 리턴해주기
		if(result != 0){
			reMap.put("check", "성공");
		}else{
			reMap.put("check", "실패");
		}
		
		return reMap;
		
	}
	
	//출장 등록 POST
		@RequestMapping(value = "es/addEsWo", method = RequestMethod.POST)
		public Map<String, Object> esWoAddCtrl(ExtraSchedule extraSchedule){
			//System.out.println("출장등록값확인:"+extraSchedule);
			int result = extraScheduleService.addEsWoServ(extraSchedule);
			
			Map<String, Object> reMap = new HashMap<String, Object>();
		
			//입력여부 비교하여 성공,실패 체크후 리턴해주기
			if(result != 0){
				reMap.put("check", "성공");
			}else{
				reMap.put("check", "실패");
			}
			
			return reMap;
			
		}
		//본인 근외일정 검색조회 - 포스트요청
		@RequestMapping(value = "es/search", method = RequestMethod.POST)
		public List<ExtraSchedule> esSearchCtrl(ExtraSchedule extraSchedule,HttpSession session) {
			int mmCode = (int)session.getAttribute("mmCode");
			System.out.println("H2 Ajax Ctrl 개인근외조회~!!");
			//세션에서 로긴 되있는 사원코드 가져와서 날짜와 조건 일치하는 데이터 조회.
			
			List<ExtraSchedule> esList = new ArrayList<ExtraSchedule>();
			
			
			System.out.println("세션에서 가져온 사원코드확인 : "+mmCode);
			
			esList = extraScheduleService.esPersonalListServ(extraSchedule);
			System.out.println("조회된 리스트확인 : "+esList);
			
			return esList;
		}
	
}
