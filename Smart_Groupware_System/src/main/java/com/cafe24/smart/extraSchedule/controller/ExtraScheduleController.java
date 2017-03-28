package com.cafe24.smart.extraSchedule.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.service.MemberService;

@Controller
public class ExtraScheduleController {

	private static final Logger log = LoggerFactory.getLogger(ExtraScheduleController.class);

	@Autowired
	private MemberService memberService;

	// GET 요청 근외일정 등록-폼이동
	@RequestMapping(value = "extraSchedule/es_add", method = RequestMethod.GET)
	public String esAddCtrl() {

		return "extraSchedule/es_add";
	}

	// GET 개인 근외일정 조회
	@RequestMapping(value = "extraSchedule/es_listSearch", method = RequestMethod.GET)
	public String cmListCtrl() {

		return "/extraSchedule/es_list";
	}

	// GET 부서 근외 조회
	@RequestMapping(value = "extraSchedule/es_dplist", method = RequestMethod.GET)
	public String cmdpListCtrl(Model model) {

		List<Department> dpList = memberService.dpListServ();

		model.addAttribute("dpList", dpList);
		
		log.debug("ExtraScheduleController cmdpListCtrl model : " + model);

		return "/extraSchedule/es_dplist";
	}
}