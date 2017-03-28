package com.cafe24.smart.wbs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.wbs.domain.Wbs;
import com.cafe24.smart.wbs.service.WbsService;

@RestController
public class WbsRestController {
	
	private static final Logger log = LoggerFactory.getLogger(WbsController.class);
	
	@Autowired
	private WbsService wbsService;
	
	// 참여인원 상세보기
	@RequestMapping(value = "wbs/checkMember", method = RequestMethod.POST)
	public Map<String, Object> pmListCtrl(Member member) {
		
		log.debug("WbsRestController pmListCtrl member : " + member);
		
		// 넘어온 사원 코드와 비밀번호로 일치하는 사원이있는지 확인한 후 
		// 그 사원코드가 팀장인 프로젝트 리스트 조회하여 view로 넘기기
		
		// 1. 사원코드와 비밀번호로 일치하는 사원있는지 확인하는 메서드 호출.
		int mmCode = wbsService.checkMemberServ(member);
		
		log.debug("WbsRestController pmListCtrl mmCode : " + mmCode);
		
		//2. 사원코드가 포함된 프로젝트 리스트 조회.
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Project> prList = new ArrayList<Project>();
		
		// 비번 일치시 사원코드리턴됨. 삭제처리!
		if(mmCode > 1 && mmCode < 10000) { 
			prList = wbsService.prListServ(mmCode);
			
			resultMap.put("result", true);
			resultMap.put("prList", prList);
		} else if(mmCode == 10000) {
			resultMap.put("result", false);
			resultMap.put("check", "비번");
		} else if(mmCode == 0) {
			resultMap.put("result", false);
			resultMap.put("check", "아이디");
		}
		
		log.debug("WbsRestController pmListCtrl resultMap : " + resultMap);
		
		return resultMap;
	}
	
	//WBS 상세보기
	@RequestMapping(value = "wbs/detail", method = RequestMethod.POST)
	public Map<String, Object> wbsDetailCtrl(@RequestParam("wbsCode") int wbsCode) {
		
		log.debug("WbsRestController wbsDetailCtrl wbsCode : " + wbsCode);
		
		Map<String, Object> wbsMap = new HashMap<String, Object>();
		
		// wbs상세정보 조회
		Wbs wbs = new Wbs();
		
		wbs = wbsService.wbsDetailServ(wbsCode);
		
		log.debug("WbsRestController wbsDetailCtrl wbs : " + wbs);
		
		//조회 성공,실패시 분기문
		if (wbs != null) {
			wbsMap.put("wbs", wbs);
			wbsMap.put("check", "성공");
		} else {
			wbsMap.put("check", "실패");
		}
		
		log.debug("WbsRestController wbsDetailCtrl wbsMap : " + wbsMap);
		
		return wbsMap;
	}
	
	//WBS 수정하기
	@RequestMapping(value = "wbs/modifyWbs", method = RequestMethod.POST)
	public Map<String, Object> wbsModifyCtrl(Wbs wbs) {
		
		log.debug("WbsRestController wbsModifyCtrl wbs : " + wbs);
		
		Map<String, Object> wbsMap = new HashMap<String, Object>();
		
		//수정되야할 항목 - wbsName,wbsContents,wbsStartDate,
		//wbsEndDate,wbsProgress,wbsUncompleatedReason,wbsFinalEndDate,wbsStatus(진행률100프로면 완료로 수정.)
		wbs = wbsService.wbsModifyServ(wbs);
		
		if (wbs != null) {
			wbsMap.put("check", "성공");
			wbsMap.put("wbs", wbs);
		} else {
			wbsMap.put("check", "실패");
		}
		
		log.debug("WbsRestController wbsModifyCtrl wbsMap : " + wbsMap);
		
		return wbsMap;
	}
}