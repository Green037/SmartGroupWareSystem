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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.service.ProjectService;



@Controller
public class ProjectController {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectService projectService;
	
	//프로젝트 등록 - 폼요청 겟방식
	@RequestMapping(value = "pr/add", method = RequestMethod.GET)
	public String prAddCtrl() {
						
		return "project/pr_addForm";
	}	

	
	//프로젝트 리스트 - 겟요청
	@RequestMapping(value = "pr/list", method = RequestMethod.GET)
	public String prListCtrl(Model model, @RequestParam(value="prProgress", defaultValue="0")int prProgress) {
		//System.out.println("h2");
		
		//모든 프로젝트 내용 조회
		List<Project> projectList = new ArrayList<Project>();
		projectList = projectService.prListServ(prProgress);
		//System.out.println(projectList);
		
		model.addAttribute("projectList", projectList);
		
		return "project/pr_list";
	}
	
	// 프로젝트 참여신청자등록 포스트요청
	@RequestMapping(value = "pr/addPm", method = RequestMethod.POST)
	public String pmAddCtrl(ProjectMember projectMember) {
		/*System.out.println("h2 Post!!");*/
		//System.out.println(projectMember);
		
		int result = projectService.pmAddServ(projectMember);
		//System.out.println("참여인원등록결과 : "+result);
		
		// 세션에 회원정보 가져와서 회원정보 세팅해줘야함.
		return "redirect:/pr/list";
	}
		
	// 프로젝트 상세보기 - 겟요청
	@RequestMapping(value = "pr/detail", method = RequestMethod.GET)
	public String prDetailCtrl(Model model, @RequestParam("prCode") int prCode) {
		//System.out.println("h2 detail~!!");
		//System.out.println("넘어온 프로젝트 코드확인 : "+prCode);
		// 프로젝트기본내용, 참여인원정보, 자금상세정보 모두 필요함.
		Project project = new Project();
		project = projectService.prDetailServ(prCode);
		
		model.addAttribute("project", project);
		
		return "project/pr_detail";
	}

}