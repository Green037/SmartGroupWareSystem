package com.cafe24.smart.wbs.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.service.ProjectService;
import com.cafe24.smart.wbs.domain.Wbs;
import com.cafe24.smart.wbs.service.WbsService;

@Controller
public class WbsController {
	
	private static final Logger log = LoggerFactory.getLogger(WbsController.class);
	
	@Autowired
	private WbsService wbsService;
	
	@Autowired
	private ProjectService projectService;
	
	//WBS 등록 -> 팀장체크화면으로 이동
	@RequestMapping(value = "wbs/add", method = RequestMethod.GET)
	public String wbsAddCtrl() {
						
		return "wbs/wbs_add";
	}	
	
	//WBS 등록 - 폼요청 겟방식
	@RequestMapping(value = "wbs/addForm", method = RequestMethod.GET)
	public String wbsAddCtrl(Model model, @RequestParam("prCode") int prCode) {
		
		log.debug("WbsController wbsAddCtrl prCode : " + prCode);
		
		// prCode로 프로젝트 내용 조회하여 view로 포워드한다.
		Map<String, Object> mmMap = new HashMap<String, Object>();
		
		Project project = new Project();
		
		project = projectService.prDetailServ(prCode); // 프로젝트 상세조회.
		
		log.debug("WbsController wbsAddCtrl project : " + project);
		
		int pmCount = projectService.pmCountServ(prCode); // 프로젝트 참여인원카운트.
		
		log.debug("WbsController wbsAddCtrl pmCount : " + pmCount);
		
		mmMap = projectService.mmDetailServ(project.getPrMemberCode()); //팀장정보
		
		log.debug("WbsController wbsAddCtrl mmMap : " + mmMap);
		
		//view에 뿌려줄 값 세팅.
		model.addAttribute("project", project);
		model.addAttribute("pmCount", pmCount);
		model.addAttribute("mmMap", mmMap);
		
		return "wbs/wbs_addForm";
	}
	
	//WBS 등록처리 -> 포스트요청.
	@RequestMapping(value = "wbs/addWbs", method = RequestMethod.POST)
	public String wbsAddCtrl(Model model, Wbs wbs) {
		
		log.debug("WbsController wbsAddCtrl wbs : " + wbs);
		
		//wbs 등록처리 메서드 호출. 성공여부 리턴값 뷰로 포워딩~!
		String result = wbsService.wbsAddServ(wbs);
		
		log.debug("WbsController wbsAddCtrl result : " + result);
		
		return "mainIndex";
	}	
}