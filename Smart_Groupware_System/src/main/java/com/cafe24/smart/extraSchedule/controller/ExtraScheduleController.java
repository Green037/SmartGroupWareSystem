package com.cafe24.smart.extraSchedule.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExtraScheduleController {
	
	private static final Logger log = LoggerFactory.getLogger(ExtraScheduleController.class);
	
	
	//GET 요청 근외일정 등록
	@RequestMapping(value ="extraSchedule/es_add", method = RequestMethod.GET)
		public String esAddCtrl(){
			
		
				return "extraSchedule/es_add";
			
		}
	
}