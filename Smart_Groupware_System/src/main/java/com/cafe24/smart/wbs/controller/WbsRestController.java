package com.cafe24.smart.wbs.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.controller.ProjectController;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.wbs.service.WbsService;

@RestController
public class WbsRestController {
	private static final Logger log = LoggerFactory.getLogger(WbsController.class);
	
	@Autowired
	private WbsService wbsService;
	
	//참여인원 상세보기
		@RequestMapping(value = "wbs/checkMember", method = RequestMethod.POST)
		public List<Project> pmListCtrl(Member member) {
			/*System.out.println("h2 Wbs Ajax");
			System.out.println("넘어온 값 : "+member);*/
		//넘어온 사원 코드와 비밀번호로 일치하는 사원이있는지 확인한후 그 사원코드가 팀장인 프로젝트 리스트 조회하여 view로 넘기기
			//1. 사원코드와 비밀번호로 일치하는 사원있는지 확인하는 메서드 호출.
			int mmCode = wbsService.checkMemberServ(member);
			//2. 사원코드가 포함된 프로젝트 리스트 조회.
			
			/*List<Project> prList = new ArrayList<Project>(); 
			
			prList = projectService.pmListServ(prCode);*/
			
			return null;
		}
}
