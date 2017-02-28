package com.cafe24.smart.wbs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WbsController {
	
	private static final Logger log = LoggerFactory.getLogger(WbsController.class);
	
	//WBS 등록 - 폼요청 겟방식
		@RequestMapping(value = "wbs/add", method = RequestMethod.GET)
		public String wbsAddCtrl() {
							
			return "wbs/wbs_add";
		}	

}