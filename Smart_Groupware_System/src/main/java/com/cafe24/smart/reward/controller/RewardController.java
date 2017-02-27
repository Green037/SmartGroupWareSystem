package com.cafe24.smart.reward.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RewardController {

	private static final Logger log = LoggerFactory.getLogger(RewardController.class);
	
	@RequestMapping(value = "re/listAll", method = RequestMethod.GET)
	public String reListAllCtrl() {
						
		return "reward/re_listAll";
	}
	
	@RequestMapping(value = "re/list", method = RequestMethod.GET)
	public String reListCtrl() {
						
		return "reward/re_list";
	}
	
	@RequestMapping(value = "re/content", method = RequestMethod.GET)
	public String reContentCtrl() {
						
		return "reward/re_content";
	}
	
	@RequestMapping(value = "re/add", method = RequestMethod.GET)
	public String reAddCtrl() {
						
		return "reward/re_add";
	}
	
}