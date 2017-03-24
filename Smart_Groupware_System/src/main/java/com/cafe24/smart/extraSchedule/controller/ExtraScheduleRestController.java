package com.cafe24.smart.extraSchedule.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
}
