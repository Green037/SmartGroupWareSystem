package com.cafe24.smart.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.service.ProjectService;


@Controller
public class ProjectController {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectService projectService;
	
	// 프로젝트등록 겟요청
	@RequestMapping(value = "pr/add", method = RequestMethod.GET)
	public String prAddCtrl() {
		// 세션에 회원정보 가져와서 회원정보 세팅해줘야함.				
		return "project/pr_addForm";
	}
	
	// 프로젝트 등록 포스트요청 - 프로젝트, 자금, 인원 폼 동시 처리.
	@RequestMapping(value = "pr/add", method = RequestMethod.POST)
	public String prAddCtrl(ProjectMember projectMember, Project project, Funds funds) {
		/*System.out.println("h2");
		System.out.println(project);
		System.out.println(funds);
		System.out.println(projectMember);*/
		
		int result = projectService.prAddServ(projectMember, project, funds);
		
		return "home";
	}	
	
	//프로젝트 리스트 - 겟요청
	@RequestMapping(value = "pr/list", method = RequestMethod.GET)
	public String prListCtrl(Model model) {
		//System.out.println("h2");
		//모든 프로젝트 내용 조회
		List<Project> projectList = new ArrayList<Project>();
		projectList = projectService.prListServ();
		System.out.println(projectList);
		
		model.addAttribute("projectList", projectList);
		
		return "project/pr_list";
	}
}