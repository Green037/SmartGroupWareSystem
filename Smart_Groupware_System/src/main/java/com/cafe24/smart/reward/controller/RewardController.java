package com.cafe24.smart.reward.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.smart.reward.domain.Reward;

@Controller
public class RewardController {
	private static final Logger log = LoggerFactory.getLogger(RewardController.class);
	
	@Autowired
	HttpSession session;
	
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
	public String reAddFormCtrl(Model model) {
						
		int mmCode = (int) session.getAttribute("id");
		
		model.addAttribute("reMmCode", mmCode);
		
		return "reward/re_add";
	}
	
	@RequestMapping(value = "re/add", method = RequestMethod.POST)
	public String reAddProCtrl(Reward reward, @RequestParam("reMmCode") int reMmCode, @RequestParam("mmCode") int mmCode) {
						
		System.out.println("RewardController reAddProCtrl mmCode : " + mmCode);
		System.out.println("RewardController reAddProCtrl reward : " + reward);
		System.out.println("RewardController reAddProCtrl reMmCode : " + reMmCode);
		
		return "home";
	}
	
}