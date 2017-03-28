package com.cafe24.smart.commute.controller;

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
public class CommuteController {

	private static final Logger log = LoggerFactory.getLogger(CommuteController.class);

	@Autowired
	private MemberService memberService;

	// 출퇴근 외출등록 - 겟요청(폼연결)
	@RequestMapping(value = "cm/add", method = RequestMethod.GET)
	public String cmAddCtrl() {

		return "/commute/cm_add";
	}

	// 개인 출퇴근 조회 - 겟요청(폼연결)
	@RequestMapping(value = "cm/listForm", method = RequestMethod.GET)
	public String cmListCtrl() {

		return "/commute/cm_list";
	}

	// 부서별 출퇴근 조회 - 겟요청(폼연결)
	@RequestMapping(value = "cm/cmDplist", method = RequestMethod.GET)
	public String cmDpListCtrl(Model model) {

		// 부서목록 조회하여 뷰로 포워딩
		List<Department> dpList = memberService.dpListServ();
		
		log.debug("CommuteController cmDpListCtrl dpList : " + dpList);
		
		model.addAttribute("dpList", dpList);

		return "/commute/cm_dplist";
	}
}