package com.cafe24.smart.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.member.domain.MemberContent;
import com.cafe24.smart.member.service.MemberService;

@RestController
public class MemberRestController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// POST 사원 조건검색조회
	@RequestMapping(value = "member/mm_listSearch", method = RequestMethod.POST)
	public List<MemberContent> mmSearchCtrl(MemberContent memberContent) {
		
		log.debug("MemberRestController mmSearchCtrl memberContent : " + memberContent);
		
		List<MemberContent> mmList = memberService.mmSearchServ(memberContent);
		
		log.debug("MemberRestController mmSearchCtrl mmList : " + mmList);

		return mmList;
	}
}