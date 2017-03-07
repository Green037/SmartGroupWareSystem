package com.cafe24.smart.commute.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommuteController {
	
	private static final Logger log = LoggerFactory.getLogger(CommuteController.class);
	
	
	// GET 요청 출퇴근 등록
		@RequestMapping(value="/commute/cm_add", method=RequestMethod.GET)
		public String cmAddCtrl(){
			
			return "/commute/cm_add";
		}
	
	// GET 요청 출퇴근 조회목록
		@RequestMapping(value="/commute/cm_list", method=RequestMethod.GET)
		public String cmListCtrl(){
					
			return "/commute/cm_list";
		}
	// GET 요청 출퇴근 조회목록
			@RequestMapping(value="/commute/cm_dplist", method=RequestMethod.GET)
			public String cmdpListCtrl(){
						
				return "/commute/cm_dplist";
			}
	
}