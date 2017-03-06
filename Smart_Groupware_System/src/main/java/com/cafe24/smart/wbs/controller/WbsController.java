package com.cafe24.smart.wbs.controller;

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
		/*System.out.println("H2 Wbs AddForm CTRL!!");
		System.out.println("넘어온 프로젝트 코드값 확인 :"+prCode);*/
		// prCode로 프로젝트 내용 조회하여 view로 포워드한다.
		Project project = new Project();
		project = projectService.prDetailServ(prCode); // 프로젝트 상세조회.
		//System.out.println(project);
		
		int pmCount = projectService.pmCountServ(prCode); // 프로젝트 참여인원.
		//System.out.println(pmCount);
		
		//view에 뿌려줄 값 세팅.
		model.addAttribute("project", project);
		model.addAttribute("pmCount", pmCount);
		
		return "wbs/wbs_addForm";
	}
	
	//WBS 등록처리 -> 포스트요청.
	@RequestMapping(value = "wbs/addWbs", method = RequestMethod.POST)
	public String wbsAddCtrl(Model model, Wbs wbs) {
		System.out.println("h2 Wbs Add POST!!");
		System.out.println(wbs);
		
		//wbs 등록처리 메서드 호출. 성공여부 리턴값 뷰로 포워딩~!
		String result = wbsService.wbsAddServ(wbs);
		System.out.println("wbs입력결과 : "+result);
		
		return "home";
	}	

}